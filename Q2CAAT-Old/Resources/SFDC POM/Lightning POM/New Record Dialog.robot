*** Settings ***
Resource    ../../Commons/Global Setup.robot
Library     SeleniumLibrary
Resource    POM Workarounds.robot    


*** Variables ***
${new button}                     link:New
${record type next button}        //div[@class="inlineFooter"]//button[.="Next"]
${close modal dialog button}      //button[@title="Close this window"]
${record type selector}           //div[@class="changeRecordTypeRow"]
${new object panel header}        //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="Account Information"]
${object actions drop down}       //div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, 'actionsContainer')]//li[contains(@class, 'ActionsDropDown')]
${next button}                    //div[contains(@class, "modal-container")]//button[@title="Next"]
${previous button}                //div[contains(@class, "modal-container")]//button[@title="Previous"]

*** Keywords ***
Loc for Textarea Field
    [Arguments]    ${field name}
    ${loc}    Catenate    //div[contains(@class, "modal-container")]//div[@class="inputHeader"]//*[.="${field name}"]/../../..//div[@class="bBody"]//textarea
    [Return]    ${loc}    

Wait New Record Modal Dialog for
    [Arguments]    ${new record name}
    ${loc}   Catenate     //div[contains(@class, "modal-container")]//div[contains(@class, "modal-header")]//h2[.="${new record name}"]
    Wait Until Page Contains Element    ${loc}   
    
New Record Dialog Should Contain Text Field
    [Arguments]    ${field name}    ${is required}=required     ${with_text}=${EMPTY}
    ${loc}    Catenate    //div[contains(@class, "modal-container")]//input[@name="${field name}"]
    Page Should Contain Element    ${loc}
    ${actual text}    Run Keyword If    '${with text}' is not '${EMPTY}'    Get Text from Field On New Record Dialog     ${loc}    
    Run Keyword If   '${with text}' is not '${EMPTY}'    Should Be Equal As Strings    ${with text}    ${actual text}    msg=Prepopulated text in '${field name}' fiels mismatch with expected 
    Run Keyword If   '${is requi red}' == 'required'  Page Should Contain Element    ${loc} [@required]    message=Field '${field name}' should be required

New Record Dialog Should Contain Textarea Field
    [Arguments]    ${field name}    ${is required}=required     ${with_text}=${EMPTY}
    ${loc}    Loc for Textarea Field    ${field name}
    Page Should Contain Element    ${loc}
    ${actual text}    Run Keyword If    '${with text}' is not '${EMPTY}'    Get Text from Field On New Record Dialog     ${loc}
    Run Keyword If   '${with text}' is not '${EMPTY}'    Should Be Equal As Strings    ${with text}    ${actual text}    msg=Prepopulated text in '${field name}' fiels mismatch with expected 
    Run Keyword If   '${is requi red}' == 'required'  Page Should Contain Element    ${loc} [@aria-required="true"]    message=Field '${field name}' should be required  

Get Text from Field On New Record Dialog
    [Documentation]    Keyword pulls out text value of inputs under shadow roots. In the ugly but universal way 
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    ${element}      Get WebElement    ${locator}
    ${text}         Call Method       ${element}        get_attribute    value
    [Return]    ${text}

Input text to Textarea Field
    [Arguments]    ${field name}    ${text}
    ${loc}    Loc for Textarea Field    ${field name}
    Input Text    ${loc}    ${text}    
    
Click Next
    Wait Until Page Contains Element    ${next button}    
    Click Element                       ${next button}
    sleep    1
    Page Should Not Contain Element     //div[contains(@class, "errorText")]    message=Unexpected error has occured. Please refer to the details log

Click Previous
    Wait Until Page Contains Element    ${previous button}    
    Click Element                       ${previous button}
    sleep    1
    Page Should Not Contain Element     //div[contains(@class, "errorText")]    message=Unexpected error has occured. Please refer to the details log
    
Click Next And Wait for Error
    [Arguments]    ${message}
    Wait Until Page Contains Element    ${next button}    
    Click Element                       ${next button}
    sleep    1      
    Element Should Contain    //div[@class="content"]//div[@data-aura-class="flowruntimeBody"]    ${message}    message=Expected error message '${message}' has not been found on the page    

New Record Dialog Should Contain RadioButton Field
    [Arguments]    ${field name}    ${is required}=required     ${with_text}=${EMPTY}
    ${selector}    Catenate   SEPARATOR=    //div[@class="bBody"][.//div[@class="inputHeader"]//div[contains(text(), "${field name}")]]//div[@class="slds-form-element__control"]//span[@class="slds-radio"][.//label[@class="slds-radio__label"][contains(.//text(), "${with_text}")]]
    Page Should Contain Element    ${selector}
    Run Keyword If   '${is requi red}' == 'required'  Page Should Contain Element    ${selector} [@aria-required="true"]    message=Field '${field name}' should be required  

New Record Dialog Should Contain DropDown List Field
    [Arguments]    ${field name}    ${is required}=required     ${with_text}=${EMPTY}
    ${selector}    Catenate   SEPARATOR=    //div[@class="bBody"][.//div[@class="inputHeader"]//div[contains(text(), "${field name}")]]//div[@class="slds-form-element__control"]//select[contains(@class, "uiInputSelect")]
    Page Should Contain Element    ${selector}
    Run Keyword If   '${is requi red}' == 'required'  Page Should Contain Element    ${selector} [@aria-required="true"]    message=Field '${field name}' should be required  

Select RadioButton Field
    [Arguments]    ${field name}    ${with_text}
    ${selector}    Catenate   SEPARATOR=    //div[@class="bBody"][.//div[@class="inputHeader"]//div[contains(text(), "${field name}")]]//div[@class="slds-form-element__control"]//span[@class="slds-radio"][.//label[@class="slds-radio__label"][contains(.//text(), "${with_text}")]]
    Click Element    ${selector}

Select Response with Status
    [Arguments]    ${status}
    ${selector}    Catenate    SEPARATOR=    //table//tbody//tr[//td[@data-label="Status"]//span[//text()="${status}"]][1]//lightning-primitive-cell-checkbox//span[@class="slds-radio"]
    ${count element}    Get Element Count    ${selector}
    ${RP selector}    Catenate    SEPARATOR=    //table//tbody//tr[//td[@data-label="Status"]//span[//text()="${status}"]][1]//th[@data-label="Response Name"]//lightning-formatted-text
    ${value RP}    Get Text    ${RP selector}    
    Run Keyword If    ${count element}!=0    Click Element    ${selector}    ELSE    Fail    Response with status "${status}" not found
    [Return]    ${value RP}

