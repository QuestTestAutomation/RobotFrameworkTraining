*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    ../Login/Login Page Locators.robot
Resource    ../SFDC Navigation/Search Locators.robot
Resource    ../Quotes/Quote Details Locators.robot
Resource    Opportunity Details Locators.robot
Library     ../../Custom Libs/Plurals.py

*** Keywords ***
Current Opportunity is '${oppty_name}'
    Wait Until Page Contains Element    ${page_type_locator}
    Element Text Should Be    ${page_type_locator}    Opportunity
    Element Text Should Be    ${oppty_name_loacator}    ${oppty_name}
    [Teardown]    Visualize keyword result    Current Opportunity is '${oppty_name}'
    
Get Oppty property '${property}' value
    ${property_locator}=    Locator for value of ${property} of Oppty
    ${value}=    Get Text    ${property_locator}
    [Return]    ${value}

Check property '${property}' of Oppty '${oppty_name}' is '${value}'
    Current Opportunity is '${oppty_name}'
    ${actual_value}=    Get Oppty property '${property}' value
    Should Be Equal As Strings    ${actual_value}    ${value}    
    [Teardown]    Visualize keyword result    Check property '${property}' of Oppty '${oppty_name}' is '${value}'   

Check property '${property}' of Oppty '${oppty_name}' is NOT '${value}'
    Current Opportunity is '${oppty_name}'
    ${actual_value}=    Get Oppty property '${property}' value
    Should Not Be Equal As Strings    ${actual_value}    ${value} 
    
Check property '${property}' of Oppty '${oppty_name}' is NOT LIKE '${value}'
    Current Opportunity is '${oppty_name}'
    ${actual_value}=    Get Oppty property '${property}' value
    Should Not Contain Any    ${actual_value}    ${value}

Check property '${property}' of Oppty '${oppty_name}' LIKE '${value}'
    Current Opportunity is '${oppty_name}'
    ${actual_value}=    Get Oppty property '${property}' value
    Should Contain Any    ${actual_value}    ${value} 
    