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
${relatedcheckloc}   //span[contains(text(),'QPC Existing Deal Reg')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::*[last()-1]
${relatedcheckloc1}   //span[contains(text(),'QPC Existing Deal Reg')]/parent::div//following-sibling::div//slot[@name='outputField']//span[contains(text(),'::After')]


*** Test Cases ***
ITQTC-XXXX - Create An Account
    #   Create Default Account  ${AccountName}  False
    #Create Related Contact for Account  0017A00000UZg9oQAD  Kan_FirstName  Kan_LastName  9999999999  kan@sharklasers.com  True
    #Create Contact Opportunity  0037A00000Q0bhUQAR
    Navigate to Opportunity  0067A000003DCRDQA4

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


Create Contact Opportunity
    [Arguments]  ${ContactObjectId}
    Open SFDC object by ID                      ${ContactObjectId}
    Wait for New Object of type        Contact
    Close Alert Message                View Duplicates
    Expand Action Menu and Click Item  New Opportunity
    Wait for New Object of type        Opportunity
    Get Value from  Opportunity Name
    Get Text  xpath=//div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem][.="Opportunity Name"]/..//slot[@name="outputField"]//[last()]
    #Navigate to Object Related Tab  Opportunities
        
Navigate to Opportunity
    [Arguments]  ${OpportunityId}
    Open SFDC Object by ID  0067A000003DCRDQA4
    Wait for New Object of type        Opportunity
   # Get Text  xpath=//div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem][.="Opportunity Name"]/..//slot[@name="outputField"]//descendant-or-self::*[last()]   #..//slot[@name="outputField"]//[last()]
   # ${OpportunityName}=  Get Text  xpath=//div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem][.="Opportunity Name"]/..//slot[@name="outputField"]//descendant-or-self::*[last()]   #..//slot[@name="outputField"]//[last()]
   # Log  ${OpportunityName}
   Wait Until Page Contains Element  xpath=//span[contains(text(),'Opportunity Name')]/parent::div//following-sibling::div//slot[@name='outputField']   #..//slot[@name="outputField"]//[last()]
    ${OpportunityOwner}  Get Text  xpath=//span[contains(text(),'Opportunity Name')]/parent::div//following-sibling::div//slot[@name='outputField']//Lightning-formatted-text   #..//slot[@name="outputField"]//[last()]
    Log  ${OpportunityOwner}   
     ${OpportunityOwner}  Get Text  xpath=//span[contains(text(),'Close Date')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::Lightning-formatted-text[last()]   #..//slot[@name="outputField"]//[last()]
    Log  ${OpportunityOwner}
     ${OpportunityOwner}  Get Text  xpath=//span[contains(text(),'Opportunity Owner')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::a[last()]   #..//slot[@name="outputField"]//[last()]
    Log  ${OpportunityOwner}  
    ${OpportunityOwner}  Get Value from  Opportunity Name
    Log  ${OpportunityOwner}
     ${OpportunityOwner}  Get Value from  Opportunity Owner
    Log  ${OpportunityOwner}
       ${OpportunityOwner}  Get Text  xpath=//span[contains(text(),'Account Name')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::a[last()]   #..//slot[@name="outputField"]//[last()]
    Log  ${OpportunityOwner} 
     ${Probability}  Get TextBox Value  Stage
    Log  ${Probability}
     ${OpportunityOwner}  Get Value from  Probability (%)
    Log  ${OpportunityOwner}
    ${OpportunityOwner}  Get Text  xpath=//span[contains(text(),'Probability (%)')]/parent::div//following-sibling::div//slot[@name='outputField']//descendant::*[last()]   #..//slot[@name="outputField"]//[last()]
    Log  ${OpportunityOwner}
    ${Probability}  Get TextBox Value  Probability (%)
    Log  ${Probability}
    ${Probability}  Get TextBox Value  Opportunity Owner
    Log  ${Probability}
    ${Probability}  Get TextBox with hyperlink Value   Opportunity Owner
    Log  ${Probability}
     ${Probability}  Get CheckBox Value  QPC Existing Deal Reg
    Log  ${Probability}
      ${Probability}  Get CheckBox Value  Territory Update Flag
    Log  ${Probability}
    ${Probability}  Get TextBox Value  Opportunity Currency
    Log  ${Probability}
    ${webdriver}  get webdriver instance
    Get Element Text   ${webdriver}  ${relatedcheckloc}
    ${attributevalue}  Get Element Attribute custom  ${webdriver}  ${relatedcheckloc}  innerText
    Log   ${attributevalue}
     Get Element Text   ${webdriver}  ${relatedcheckloc1}
   

