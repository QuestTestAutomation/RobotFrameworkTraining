*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    ../Quotes/Quote Details Locators.robot

*** Variables ***
${preview approvals title}         //div[@id="sbPreviewApprovals"]//h1[.="Preview Approvals"]
${submit for approval button}      //input[@value="Submit for Approval"]
${return to quote button}          //input[@value="Return to CPQ Quote"]
${no approvals req message}        //div[@class="apexp"]//span[.="No Approvals Required"]
${approval error box}              //div[contains(@class, "message error")]
${return to cpq quote button}      //input[@value="Return to CPQ Quote"]

*** Keywords ***
Approval Step Locator
    [Arguments]    ${step number}
    ${loc}    Catenate    SEPARATOR=    //div[@id="step    ${step number}    "]
    [Return]    ${loc}

Approval Error Message
    [Arguments]    ${message}
    ${url}         Get Location
    ${message}     Catenate   SEPARATOR=\n    ${message}    Preview Approvals page: ${url}
    [Return]    ${message}    

Click Return to CPQ Quote
    Wait Until Page Contains Element    ${return to cpq quote button}
    Click Element    ${return to cpq quote button}    
    Wait Until Page Contains Element     ${edit_button}    

Click Submit for Approval  
    Wait Until Page Contains Element     ${submit for approval button}
    Click Element                        ${submit for approval button}
    Wait Until Page Contains Element     ${edit_button}    error=Submit for approval was not finished

No Approval Required Notification should be shown
    Wait Until Page Contains Element    ${preview approvals title} 
    ${message}     Approval Error Message    Quote expected to have No Approval Required
    Wait Until Page Contains Element    ${no approvals req message}    timeout=20 seconds    error=${message}
    Page Should Contain Element         ${no approvals req message}    message=${message}    

No Approval Required Notification should NOT be show
    Wait Until Page Contains Element    ${preview approvals title}
    sleep    1
    ${message}     Approval Error Message   Quote expected to have approval rules assigned. Please check approval conditions 
    Page Should Not Contain Element    ${no approvals req message}    message=${message}

Preview Approvals Page Should Contain Step '${step number}'
    ${step loc}    Approval Step Locator    ${step number}
    ${message}     Approval Error Message    Approval Step '${step number}' missed.
    Page Should Contain Element    ${step loc}    message=${message}

Preview Approvals Page Should NOT Contain Step '${step number}'
    ${step loc}    Approval Step Locator    ${step number}
    ${message}     Approval Error Message    Approval Step '${step number}' should not be assigned to the quote 
    Page Should Not Contain Element    ${step loc}    message=${message}

Check Approval Step
    [Arguments]    ${step number}    ${approval chain}    ${rule name}    ${approvers}=[]
    ${step loc}         Approval Step Locator    ${step number}
    Preview Approvals Page Should Contain Step '${step number}'
    #${chain loc}        Catenate    SEPARATOR=    ${step loc}    //td[@align="center"]/span
    #${rule loc}         Catenate    SEPARATOR=    ${step loc}    //span[contains(@style, "italic")]
    
    #${actual chain}     Get Text    ${chain loc}
    #${actual rule}      Get Text    ${rule loc}
    #Should Be Equal As Strings    ${approval chain}    ${actual chain}   msg=Approval Chain should be '${approval chain}'. Actual chain is '${actual chain}'
    #Should Be Equal As Strings    ${rule name}    ${actual rule}         msg=Approval Rule should be '${rule name}'. Actual rule is '${actual rule}'
    #${approvers loc}    Catenate    SEPARATOR=    ${step loc}    //tr[2] 
    
    ${chain message}    Approval Error Message    Expected Approval Chain '${approval chain}' not found
    Element Should Contain    ${step loc}    ${approval chain}     msg=${chain message}
    
    ${rule message}     Approval Error Message    Expected Approval Rule '${rule name}' not found
    Element Should Contain    ${step loc}    ${rule name}          msg=${rule message}

    FOR    ${approver}    IN    @{approvers} 
        ${approver message}    Approval Error Message    Approver '${approver}' missed in Approval Step '${step number}' for chain '${approval chain}' and rule '${rule name}'
        Element Should Contain    ${step loc}    ${approver}    message=${approver message} 
    END
    
     
       