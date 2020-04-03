*** Settings ***
Library     SeleniumLibrary    
Resource    ../Common Elements.robot



*** Keywords ***
Go To Contacts Tab
    ${url}    Catenate     SEPARATOR=    ${LIGHTNING_BASE_URL}    /o/Contact/list?filterName=Recent
    Go To    ${url}
    Wait Until Element Contains    //nav[@role="navigation"][@aria-label="Breadcrumbs"]    Contacts  

Open Contact by ID
    [Arguments]    ${ID}
    Go To    ${LIGHTNING_BASE_URL}/r/Contact/${ID}/view  

Related List Contains Contact
    [Arguments]    ${contact name}
    Open Quick Link                            Related Contacts
    Click Quick Filter Button
    Filter:Insert value in Text Box            Contact Name    ${contact name}
    Click Apply Filter Button
    ${selector}    Catenate    SEPARATOR=      //tbody//th[.//a[@title='${contact name}']]
    Wait Until Page Contains Element	       //div[@class='forceRelatedListDesktop']//div[@aria-live='polite']//span[contains(.//text(), 'Updated')]
    ${count element}    Get Element Count      ${selector}
    Run Keyword IF    ${count element}==0      Capture Page Screenshot
    Run Keyword IF    ${count element}==0      FAIL    Related List does not contain Contact "${contact name}"

SFDX Crerate Contact
    [Arguments]    ${test account id}    ${first name}    ${last name}
    ${values}    Catenate    AccountID=${test account id}    FirstName='${first name}'    LastName='${last name}' 
    ${new contact id}    Create Data Record    Contact    ${values}
    [Return]    ${new contact id[0]}    


