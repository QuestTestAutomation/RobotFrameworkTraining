*** Settings ***
Library     SeleniumLibrary    
Resource    ../Common Elements.robot
Resource    ../../../Commons/Global Setup.robot
Resource    ../../SFDC Navigation/Search and Open SFDC Objects.robot

*** Keywords ***
Go To Responses Tab
    ${url}    Catenate     SEPARATOR=    ${LIGHTNING_BASE_URL}    /o/Response__c/list?filterName=Recent
    Go To    ${url}
    Wait Until Element Contains    //nav[@role="navigation"][@aria-label="Breadcrumbs"]    Responses

Simple Create Response
    [Arguments]    ${type}=MQL    ${contact}=${EMPTY}     
    Go To Responses Tab
    Go To Create New Record Dialog    Response    ${type}  
    Run Keyword If    '${contact}' is not '${EMPTY}'   Select Value in LookUp   Contact    ${contact}
    Click Save Button
    Wait for New Object of type      Response 
    ${created object url}            Get Location
    Set Test Message                 Response created. URL: ${created object url}

SFDX Create Response
    [Arguments]    ${record type}    ${contact}=${EMPTY}    ${product group}=${EMPTY}    ${product interest}=${EMPTY}
    ${contact id}     Run Keyword If    '${contact}' is not '${EMPTY}'   Get Contact ID by Contact Name   ${contact}    ELSE    Set Variable    ${EMPTY}   
    ${type id}        Get Record Type ID By Name    ${record type}
    ${product group id}       Run Keyword If    '${product group}'!='${EMPTY}'	    Get Product Group ID By Name	    ${product group}        ELSE    Set Variable    ${EMPTY}
    ${product interest id}    Run Keyword If    '${product interest}'!='${EMPTY}'	Get Product Interest ID By Name	    ${product interest}     ELSE    Set Variable    ${EMPTY}
    ${values}         Set Variable If    '${contact}' is not '${EMPTY}'          RecordTypeId=${type id} Contact__c=${contact id}     RecordTypeId=${type id}      
    ${values}         Set Variable If    '${product group}' is not '${EMPTY}'           ${values} Product_Group__c=${product group id}          ${values}
    ${values}         Set Variable If    '${product interest}' is not '${EMPTY}'        ${values} Product_Interest__c=${product interest id}    ${values}    
    ${response id}    Create Data Record    Response__c    ${values}
    #Open SFDC object by ID    ${response id}[0]
    [Return]    ${response id}[0]
    
Complete Assign Response to Partner
     [Arguments]    ${rv account}=RV Account For GB RV
     ${aloha iframe loc}                 Catenate          //div[@class="oneAlohaPage"]//iframe[@force-alohapage_alohapage]
     Wait Until Page Contains Element    ${aloha iframe loc}
     Select Frame                        ${aloha iframe loc}
     Wait Until Page Contains Element    //td[@class="pbTitle"]//*[.="Assign to Partner"] 
     sleep    1   
     Input Text                          //label[.="RV Account"]//ancestor-or-self::tr//input[@type="text"]    ${rv account}
     Click Element                       //input[@value="Create"]
     Wait Until Page Contains Element    ${aloha iframe loc}
     Select Frame                        ${aloha iframe loc}
     Wait Until Page Contains Element    //td[@class="messageCell"]
     Wait Until Element Contains         //td[@class="messageCell"]    Success
     Wait Until Element Contains         //td[@class="messageCell"]    has been successfully converted into an Opportunity

No Assign Response to Partner Page Shown
    Page Should Not Contain Element    //force-aloha-page
    
Change Response Owner
    [Arguments]    ${response id}    ${new onwner name}
    ${owner id}    Get User ID for   ${new onwner name}
    Update Data Record    Response__c    ${response id}    OwnerId=${owner id}  
    
Open Response By ID
    [Arguments]    ${ID}
    Go To    ${LIGHTNING_BASE_URL}/r/Account/${ID}/view  