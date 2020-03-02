*** Settings ***
Resource    ../../SFDC Navigation/Search Locators.robot
Resource    ../../SFDC Navigation/Search and Open SFDC Objects.robot
Resource    Opportunity Details Locators.robot
Resource    ../Common Elements/Details Page.robot

*** Keywords ***
Create Oppty for Contact '${contact name}' from Account '${account name}'
    Open Contact by Account Name and Contact Name    ${account name}    ${contact name}
    Click Element    ${new oppty button}
    Wait Until Element Is Visible    ${save button}    
    Wait Until Page Contains    New Opportunity
    Click Element    ${save button}
    Wait Until Page Contains Element    ${oppty page type}
    ${oppty name}      Get Current Object Name
    ${oppty id}          Get Current Object ID
    Set Test Variable    ${NEW_QUOTE_NAME}    ${oppty name}
    Set Test Variable    ${NEW_QUOTE_ID}    $oppty id}
    Set Test Message    \nCreated Oppty: ${oppty name}\n    append=yes
    Set Test Message    \nContact: ${contact name} Account: ${account name}\n    append=yes
    
Go To Edit Opportunity Screen
    Wait Until Page Contains Element    ${oppty page type}
    Wait Until Page Contains Element    ${edit button}    
    Click Element                       ${edit button}
    Wait Until Page Contains Element    ${save button}     
           
    
    