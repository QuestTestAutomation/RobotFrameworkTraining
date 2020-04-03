*** Settings ***
Library     SeleniumLibrary    
Resource    ../Common Elements.robot



*** Keywords ***
Go To Opportunities Tab
    ${url}    Catenate     SEPARATOR=    ${LIGHTNING_BASE_URL}    /o/Opportunity/list?filterName=Recent
    Go To    ${url}
    Wait Until Element Contains    //nav[@role="navigation"][@aria-label="Breadcrumbs"]    Opportunities    

Opportunity Contains Contact Role
    [Arguments]    ${contact id}
    Open Related List                          Contact Roles
    ${selector}    Catenate    SEPARATOR=      //tbody//th[.//a[@data-recordid='${contact id}']]
    Wait Until Page Contains Element	       //div[@class='forceRelatedListDesktop']//div[@aria-live='polite']//span[contains(.//text(), 'Updated')]
    ${count element}    Get Element Count      ${selector}
    Run Keyword IF    ${count element}==0      Capture Page Screenshot
    Run Keyword IF    ${count element}==0      FAIL    Opportunity does not contain Contact Role for "${contact id}"
