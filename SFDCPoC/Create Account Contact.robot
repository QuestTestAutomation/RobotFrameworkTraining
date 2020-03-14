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

Suite Setup       Lightning Suite Setup
#Suite Teardown    Lightning Suite Teardown

*** Variables ***
${AccountName}                    "Test Automation Account"
${RelatedTab}         //a[contains(@class, "entityNameTitle")] 
${new object panel header}        //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="Account Information"]

*** Test Cases ***
ITQTC-XXXX - Create An Account
    #   Create Default Account  ${AccountName}  False
    Create Related Contact for Account  0017A00000UZg9oQAD  Kan_FirstName  Kan_LastName  9999999999  kan@sharklasers.com  True


*** Keywords ***

Simple Create Default Account
    [Arguments]    ${account name}    ${with random postfix}=False
    ${random part}    Generate Random String     6    chars=[NUMBERS]
    ${account name}    Run Keyword If    ${with random postfix} == True    Catenate    SEPARATOR=-     ${account name}    ${random part}    ELSE    Catenate    ${account name}
    GoTo Object Tab    Accounts
    GoTo Create New Record Dialog    Account             record type=Default Account Record Type
    Insert value in Text Box         Account Name        ${account name}
    Insert value in Text Box         Phone               1234566789
    Insert value in Text Box         Street              4 Polaris Way
    Insert value in Text Box         City                Aliso Viejo
    Insert value in Text Box         Zip/Postal Code     92656
    Select Value in Picklist         Account Currency    USD - U.S. Dollar
    Select Value in LookUp           Country             United States 
    Click Save Button
    Wait for New Object of type      Account 
    ${created object url}            Get Location
    Set Test Message                 Account created: Name: '${account name}', URL: ${created object url}  
 
Create Default Account
    [Arguments]  ${AccountName}   ${with random postfix}=False
    ${random part}    Generate Random String     6    chars=[NUMBERS]
    ${AccountName}    Run Keyword If    ${with random postfix} == True    Catenate    SEPARATOR=-     ${AccountName}    ${random part}    ELSE    Catenate    ${AccountName}
    GoTo Object Tab    Accounts
    GoTo Create New Record Dialog    Account             record type=Default Account Record Type
    Insert value in Text Box         Account Name        ${AccountName}
    Insert value in Text Box         Phone               1234566789
    Insert value in Text Box         Street              4 Polaris Way
    Insert value in Text Box         City                Aliso Viejo
    Insert value in Text Box         Zip/Postal Code     92656
    Select Value in Picklist         Account Currency    USD - U.S. Dollar
    Select Value in LookUp           Country             United States 
    Click Save Button
    ${created object url}            Get Location
    Set Test Message                 Account created: Name: '${account name}', URL: ${created object url}  
    Click Element  //*[.="relatedListsTab"] 
 
Create Related Contact for Account
    [Arguments]  ${AccountObjectId}  ${ContactFirstName}=test_firstname    ${ContactLastName}=test_lastname  ${ContactPhone}=999999999  ${ContactEmail}=test@sharklasers.com  ${with random postfix}=False  
    ${random part}    Generate Random String     6    chars=[NUMBERS]   
    ${ContactFirstName}   Run Keyword If    ${with random postfix} == True     Catenate    SEPARATOR=-     Test_FirstName    ${random part}    ELSE    Catenate    ${ContactFirstName}
    ${ContactLastName}    Run Keyword If    ${with random postfix} == True   Catenate    SEPARATOR=-     Test_LastName     ${random part}    ELSE    Catenate    ${ContactLastName}
    ${ContactPhone}    Run Keyword If    ${with random postfix} == True   Catenate    999999999   ELSE    Catenate    ${ContactPhone}
    ${ContactEmail}    Run Keyword If    ${with random postfix} == True   Catenate    ${ContactFirstName}  ${random part.strip()}  @sharklasers.com   ELSE    Catenate    ${ContactEmail}  
    ${ContactEmail}=   Replace String  ${ContactEmail}  ${SPACE}  ${empty}
    Open SFDC object by ID                      ${AccountObjectId}
    Navigate to Object Related Tab  Contacts
    Create New Record Dialog    Contact             record type=Default Contact Record 
    Insert value in Text Box         First Name        ${ContactFirstName}
    Insert value in Text Box         Last Name         ${ContactLastName}
    Insert value in Text Box         Phone             ${ContactPhone}
    Insert value in Text Box         Email             ${ContactEmail}
    Click Save Button
    ${created object url}            Get Location
    Set Test Message                 Contact created: Email: '${ContactEmail}', URL: ${created object url}
    ${RelatedLoc}   Loc for Related Tab link  Contacts
    #Scroll Element Into View  xpath=//div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']
    #Execute JavaScript    document.getElementByXpath("//span[text()='Contacts']/parent::a").onclick()
   # ${webdriver}  utillib.get_webdriver_instance
   # ${href}  Get Element Attribute   xpath=//div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']/parent::a  href
  #  ${webdriver}  get webdriver instance
    #${webdriver}  Call Method  utillib  get webdriver instance
   
   # Element scroll into view By Xpath  ${webdriver}  //div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']
  #  Element scroll into view By Xpath  ${webdriver}  //div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']/parent::a
  #  ${attributevalue}  Get Element Attribute custom  ${webdriver}  //div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']/parent::a  href
   # Go To  ${attributevalue}
    #Click Element By Xpath   ${webdriver}  //*[@id="tab-4"]/slot/flexipage-component2/force-progressive-renderer/slot/slot/flexipage-aura-wrapper/div/div/div/div[13]/article/div[1]/header
    #Click Element By Xpath   ${webdriver}  //div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']/parent::a
    #Click Element By Xpath   ${webdriver}  //div[contains(@class, "forceRelatedListSingle")]//span[text()='Contacts']/parent::a
    #Click Element By Xpath   ${webdriver}  //span[text()='Contracted Prices']
    #Scroll Element Into View  xpath=//span[text()='Contacts']
    #Click Element  xpath://a[@title="New"]
    #Click Element  xpath=//span[text()='Contacts']/parent::a
    #Click Element  ${RelatedLoc} 
     
Loc for Related Tab link
    [Arguments]  ${LinkLabel}
    ${loc}    Catenate    SEPARATOR=   //div[contains(@class, "forceRelatedListSingle")]//span[text()='  ${LinkLabel}  ']/parent::a
    [Return]    ${loc}
    
Loc for Related Landing Page
    [Arguments]  ${LinkLabel}
    ${loc}    Catenate    SEPARATOR=   //h1[@title="  ${LinkLabel}  "]
    [Return]    ${loc}
    
Loc for New Object Page
    [Arguments]  ${Object}
    ${loc}    Catenate    SEPARATOR=   //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="  ${Object}  ${SPACE}   Information"]
    [Return]    ${loc}
   
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
    
    
