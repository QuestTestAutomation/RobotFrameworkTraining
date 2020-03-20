*** Settings ***
Library     SeleniumLibrary    
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
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

#Suite Setup       Lightning Suite Setup
#Suite Teardown    Lightning Suite Teardown




*** Keywords ***

Loc for Related Tab link
    [Arguments]  ${LinkLabel}
    ${loc}    Catenate    SEPARATOR=   //div[contains(@class, "forceRelatedListSingle")]//span[text()='  ${LinkLabel}  ']/parent::a
    [Return]    ${loc}
    
Loc for Related Landing Page
    [Arguments]  ${LinkLabel}
    ${loc}    Catenate    SEPARATOR=   //h1[@title="  ${LinkLabel}  "]
    [Return]    ${loc}
    
Loc for popup page header
    [Arguments]  ${Objectheader}
    ${loc}    Catenate    SEPARATOR=   //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="${Objectheader}"]
    [Return]    ${loc}
    
Wait for popup page header 
    [Arguments]  ${Objectheader}
    ${loc}  Loc for popup page header  ${Objectheader}
    Wait Until Page Contains Element   ${loc}
   
Navigate to Object Related Tab
    [Arguments]  ${LinkLabel}
    ${relatedloc}  Loc for Related Tab link  ${LinkLabel}
    ${landingloc}  Loc for Related Landing Page  ${LinkLabel}
  
    ${webdriver}  get webdriver instance
    Element scroll into view By Xpath  ${webdriver}  ${relatedloc}
    ${attributevalue}  Get Element Attribute custom  ${webdriver}  ${relatedloc}  href
    Go To  ${attributevalue}
    Wait Until Page Contains Element  ${landingloc}
    
Create New Record Dialog
    [Arguments]    ${object}    ${record type}=${None}    
    Wait Until Page Contains Element    ${new button}    
    Click Element                       ${new button}
    ${expected header}    Loc for New Object Dialog Header    ${object}
    Wait Until Page Contains Element    ${expected header}
    ${if record types enabled}    Get Element Count    ${record type selector}
    Run Keyword If    '${record type}' is '${None}' and ${if record types enabled} > 0    Fail    msg=Record type should be specified when '${object}' is created
    Run Keyword If    '${record type}' is not '${None}'    Select Record Type    ${record type} 
    ${create new object panel header}  Loc for New Object Page   ${object}
    Wait Until Page Contains Element    ${create new object panel header}
    
Get TextBox Value 
    [Documentation]  This Keyword retrives the text box value Displayed in lightning .
    ...    
    [Arguments]  ${TextBoxLabel}
    ${TextBoxLabel}  CATENATE  xpath=//span[contains(text(),'${TextBoxLabel}')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::*[last()]
    ${TextBoxValue}  GET TEXT  ${TextBoxLabel}
    [Return]  ${TextBoxValue}
    
Get CheckBox Value 
    [Documentation]  This Keyword retrives the text box value Displayed in lightning .
    ...    
    [Arguments]  ${TextBoxLabel}
    ${TextBoxLabel}  CATENATE  xpath=//span[contains(text(),'${TextBoxLabel}')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::*[last()-1]
    ${TextBoxValue}  GET TEXT  ${TextBoxLabel}
    [Return]  ${TextBoxValue}
    
Get TextBox with hyperlink Value 
    [Documentation]  This Keyword retrives the text box displayed in lightning UI which is a hyperlinl.
    ...    
    [Arguments]  ${TextBoxLabel}
    ${TextBoxLabel}  CATENATE  xpath=//span[contains(text(),'${TextBoxLabel}')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::a[last()]
    ${TextBoxValue}  GET TEXT  ${TextBoxLabel}
    [Return]  ${TextBoxValue}
    
Input text to Textarea Field New
    [Arguments]    ${field name}    ${text}
    ${loc}    Loc for Textarea Field    ${field name}
    Input Text    ${loc}    ${text}  
    
Select Pick List Value using custom locator and select dropdown value by display value
    [Documentation]  This ketyword is an alternative incase of a custom locator has to be used for selecting pick list value by Label.
    [Arguments]  ${SelectLocator}  ${Value}
    Wait Until Page Contains Element  ${SelectLocator}
    Click Element  ${SelectLocator}
    Select From List By Label    ${SelectLocator}  ${Value}
    
Input Text Value using custom locator 
     [Documentation]  This ketyword is an alternative incase of a custom locator has to be used for inputing a value into Text Box or Text Area.
     [Arguments]  ${InputLocator}  ${Value}
     Wait Until Page Contains Element  ${InputLocator}
     Click Element  ${InputLocator}
     Input Text    ${InputLocator}  ${Value}
     
Input Text Value using custom locator into a combobox
     [Documentation]  This ketyword is an alternative incase of a custom locator has to be used for inputing a value into Text Box or Text Area.
     [Arguments]  ${InputLocator}  ${Value}
     Wait Until Page Contains Element  ${InputLocator}
     Click Element  ${InputLocator}
     Input Text    ${InputLocator}  ${Value}
     Sleep  3
     Press Keys  ${InputLocator}  ENTER
     
Wait for Webpage Object Header to Load
    [Arguments]  ${HeaderText}
    ${loc}  Catenate  //div[@class='DESKTOP uiContainerManager']//h2[.="${HeaderText}"]
    Wait Until Page Contains Element  ${loc}

#############################Added Keywords on 17Mar2020
