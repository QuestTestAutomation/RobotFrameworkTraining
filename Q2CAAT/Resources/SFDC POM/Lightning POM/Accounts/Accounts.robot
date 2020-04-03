*** Settings ***
Library     SeleniumLibrary    
Resource    ../Common Elements.robot
Resource    ../../SFDC Navigation/Search and Open SFDC Objects.robot
Resource    ../../../Commons/Test Data Mgmt.robot

*** Variables ***
${LIGHTNING_DEFAULT_ACCOUNT}    ${EMPTY}
${LIGHTNING_PARTNER_ACCOUNT}    ${EMPTY}


*** Keywords ***
Go To Accounts Tab
    ${url}    Catenate     SEPARATOR=    ${LIGHTNING_BASE_URL}    /o/Account/list?filterName=Recent
    Go To    ${url}
    Wait Until Element Contains    //nav[@role="navigation"][@aria-label="Breadcrumbs"]    Accounts    

Open Account by ID
    [Arguments]    ${ID}
    Go To    ${LIGHTNING_BASE_URL}/r/Account/${ID}/view

Simple Create Default Account
    [Arguments]    ${account name}    ${with random postfix}=False
    ${random part}    Generate Random String     6    chars=[NUMBERS]
    ${account name}    Run Keyword If    ${with random postfix} == True    Catenate    SEPARATOR=-     ${account name}    ${random part}    ELSE    Catenate    ${account name}
    Go To Accounts Tab
    Go To Create New Record Dialog   Account             #record type=Default Account Record Type
    Insert value in Text Box         Account Name        ${account name}
    Insert value in Text Box         Phone               1234566789
    Run Keyword If    '${SANDBOX}' == 'DEVFULL'  Insert value in Text Box	Street              4 Polaris Way    ELSE    Insert text to Textarea Field    Street 1    4 Polaris Way
    Run Keyword If    '${SANDBOX}' == 'DEVFULL'  Insert value in Text Box   City                Aliso Viejo      ELSE    Insert value in Text Box    City 1                Aliso Viejo
    Run Keyword If    '${SANDBOX}' == 'DEVFULL'  Insert value in Text Box   Zip/Postal Code     92656            ELSE    Insert value in Text Box    Zip/Postal Code 1     92656
    Run Keyword If    '${SANDBOX}' == 'DEVFULL'  Select Value in LookUp     Country             United States    ELSE    Insert value in Text Box    Country 1             United States
    Run Keyword If    '${SANDBOX}' == 'DEVFULL'  Select Value in LookUp     State/Province      California       ELSE    Insert value in Text Box    State/Province 1      California
    Select Value in Picklist   Account Currency    USD - U.S. Dollar 
    Click Save Button
    Wait for New Object of type      Account 
    ${created object url}            Get Location
    Set Test Message                 Account created: Name: '${account name}', URL: ${created object url}
    [Return]      ${random part}

Open Default Account from Test Data
    ${LIGHTNING_DEFAULT_ACCOUNT}    Fetch Random Test Object From Worksheet    Default Accounts
    Set Test Variable          ${LIGHTNING_DEFAULT_ACCOUNT}    
    Open Account by ID         ${LIGHTNING_DEFAULT_ACCOUNT['ID']}
    Log Location  
    
Open Partner Account from Test Data
    ${LIGHTNING_PARTNER_ACCOUNT}    Fetch Random Test Object From Worksheet    Partner Accounts
    Set Test Variable          ${LIGHTNING_PARTNER_ACCOUNT}     
    Open Account by ID         ${LIGHTNING_PARTNER_ACCOUNT['ID']}
    Log Location  
  

