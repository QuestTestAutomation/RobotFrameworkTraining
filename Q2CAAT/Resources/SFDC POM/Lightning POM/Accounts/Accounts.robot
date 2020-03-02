*** Settings ***
Library     SeleniumLibrary    
Resource    ../Common Elements.robot



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
    