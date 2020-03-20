 *** Settings ***
Library     SeleniumLibrary    
Resource    ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Q2CAAT/Resources/Commons/Global Setup.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Login/Login.robot
Resource        ../Q2CAAT/Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Q2CAAT/Lightning Tests/Lightning Suite Commons.robot
Library         ../Q2CAAT/PythonLibs/Utillib.py  WITH NAME  utillib
Library         ../Q2CAAT/PythonLibs/SelUtil.py  WITH NAME  utillib1
Resource       SeshiCommons.robot


Suite Setup       Lightning Suite Setup
#Suite Teardown    Lightning Suite Teardown

*** Variables ***
${AccountName}                    "Test Automation Account"
${RelatedTab}         //a[contains(@class, "entityNameTitle")] 
${new object panel header}        //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="Account Information"]
${relatedcheckloc}   //span[contains(text(),'QPC Existing Deal Reg')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::*[last()-1]
${relatedcheckloc1}   //span[contains(text(),'QPC Existing Deal Reg')]/parent::div//following-sibling::div//slot[@name='outputField']//span[contains(text(),'::After')]
${ActionDropdown}       //div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, "primaryFieldRow")]//div[contains(@class, 'actionsContainer')]//*[@data-key="down"]/../..    #/ancestor-or-self::a    #//div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, 'actionsContainer')]//li[contains(@class, 'ActionsDropDown')]
${save button}                    //div[@class="inlineFooter"]//button[.="Save"]
${audittypeselector}   //div[@class='inputHeader']//div[contains(text(),'Audit Type')]/ancestor::div[@class='bBody']//select
${projectphaseselector}  //span[contains(text(),'Project Phase')]/ancestor::div[1]//select
${NominatingRep}  //label[contains(text(),'Nominating Rep')]/ancestor::lightning-grouped-combobox[1]//input
${NominatingBU}  //span[contains(text(),'Primary Nominating BU')]/ancestor::div[1]//select
${nominationnotesselector}   //div[@class='inputHeader']//div[contains(text(),'Nomination Notes')]/ancestor::div[@class='bBody']//textarea
${Mortstartdate}  //span[contains(text(),'Moratorium Start Date')]/ancestor::div[2]//Input
${Mortenddate}  //span[contains(text(),'Moratorium End Date')]/ancestor::div[2]//Input
${MortComments}   //div[@class='inputHeader']//div[contains(text(),'Comments / Next Steps')]/ancestor::div[@class='bBody']//textarea

*** Test Cases ***
ITQTC-5014 - Verify button Compliance Audit button is displayed on Account screen
    [Tags]  C1146511
    Open SFDC object by ID                      0013000000jcf4JAAQ
    Wait for New Object of type                 Account
    Verify the Action Button exists in screen   New Compliance Audit
    Sleep  3
    Create New Compliance Audit for Account     0013000000jcf4JAAQ
    
ITQTC-5015- Verify button Compliance Moratorium button is displayed on Account screen
    [Tags]  C1146513
    Open SFDC object by ID                      0013000000jcf4JAAQ
    Wait for New Object of type                 Account
    Verify the Action Button exists in screen   New Compliance Moratorium
    Sleep  3
    Create Account Compliance Moratorium        0013000000jcf4JAAQ

*** Keywords ***
Verify the Action Button exists in screen
    [Documentation]  Verifies if the button exists in action dropdown menu
    [Arguments]    ${ButtonTitle}
    ${selector}    Catenate    SEPARATOR=    //div[@class='branding-actions actionMenu']//a[@title='${ButtonTitle}']
    
    
    Wait Until Page Contains Element         ${ActionDropdown}
    ${current location}     Get Location
    Wait Until Element Is Visible            ${ActionDropdown}    
    sleep    2 
    Click Element                            ${ActionDropdown} 
    ${count element}    Get Element Count    ${selector}
    Run Keyword IF    ${count element}==0    FAIL    Page does not contain Button "${ButtonTitle}"  
    Run Keyword IF    ${count element}>1     FAIL    Page contain's multiple Button's matching the selector criteria "${ButtonTitle}"  
    PRESS Keys  ${ActionDropdown}  ESC
    Set Test Message  Page does not contain Button "${ButtonTitle}"    append=True  

Create New Compliance Audit for Account
    [Documentation]  Creates a new compliance object for an existing Account
    [Arguments]      ${AccountObjectId}
    Open SFDC object by ID                      ${AccountObjectId}
    Wait for New Object of type                 Account
    Sleep  5
    Expand Action Menu and Click Item           New Compliance Audit
     Sleep  5
    Wait Until Page Contains Element   //div[@class='DESKTOP uiContainerManager']//h2[.="New Compliance Audit"]
    Select Pick List Value using custom locator and select dropdown value by display value   ${audittypeselector}  Internal 
    #Wait Until Page Contains Element  ${audittypeselector}
    #Click Element  ${audittypeselector}
    #Select From List By Label    ${audittypeselector}  Internal 
    Select Pick List Value using custom locator and select dropdown value by display value   ${NominatingBU}  IM
    #Click Element  ${NominatingBU}
    #Select From List By Label    ${NominatingBU}  IM 
    Select Pick List Value using custom locator and select dropdown value by display value   ${projectphaseselector}  Nominated 
    #Click Element  ${projectphaseselector}
    #Select From List By Label    ${projectphaseselector}  Nominated 
    Input Text Value using custom locator into a combobox  ${NominatingRep}     Test User
    Input Text Value using custom locator  ${nominationnotesselector}    Notes 
    #Click Element  ${NominatingRep}
    #Input Text    ${NominatingRep}     Test User
    #Sleep  5
    #Press Keys  ${NominatingRep}  ENTER
    #Click Element  ${nominationnotesselector}
    #Input Text    ${nominationnotesselector}    Notes 
    Click Element  //button[.="Next"]
    sleep  2
    Wait Until Page Does Not Contain Element    //div[@class='panel slds-modal slds-fade-in-open']
    sleep    5
    ${CompllianceAudit}  Get Value from  Compliance Name
    ${Account}  Get Value from  Account
    ${created object url}            Get Location
    ${TestMessage}   Catenate  Compliance Audit with name ${CompllianceAudit} for Account ${Account} is created and the location is URL: ${created object url}
    Set Test Message  ${TestMessage}   append=True   
    

Create Account Compliance Moratorium 
    [Documentation]  Creates a new compliance moratorium object for an existing Account
    [Arguments]      ${AccountObjectId}   
    Open SFDC object by ID                      ${AccountObjectId}
    Wait for New Object of type                 Account
    Sleep  3
    Expand Action Menu and Click Item           New Compliance Moratorium
    Sleep  3
    Wait for Webpage Object Header to Load  New Compliance Moratorium
   # Wait Until Page Contains Element   //div[@class='DESKTOP uiContainerManager']//h2[.="New Compliance Moratorium"]        
    Input Text Value using custom locator  ${Mortstartdate}  Mar 3, 2020
    Input Text Value using custom locator  ${Mortenddate}  Dec 3, 2020
    Input Text Value using custom locator into a combobox  ${NominatingRep}     Test User
    Select Pick List Value using custom locator and select dropdown value by display value   ${NominatingBU}  IM
    Input Text Value using custom locator  ${MortComments}    Comments 
     Click Element  //button[.="Next"]
    sleep  2
    Wait Until Page Does Not Contain Element    //div[@class='panel slds-modal slds-fade-in-open']
    sleep   3
    ${CompllianceAudit}  Get Value from  Compliance Name
    ${Account}  Get Value from  Account
    ${created object url}            Get Location
    ${TestMessage}   Catenate  Compliance Audit with name ${CompllianceAudit} for Account ${Account} is created and the location is URL: ${created object url}
    Set Test Message  ${TestMessage}   append=True   
    
    

