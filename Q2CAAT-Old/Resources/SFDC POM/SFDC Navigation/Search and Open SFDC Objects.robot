*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    ../Login/Login Page Locators.robot
Resource    Search Locators.robot
Resource    ../../Commons/SFDX.robot
Library     ../../Custom Libs/Plurals.py


*** Keywords ***
Search in '${ObjectType}' for '${query}'
    Wait Until Page Contains Element    ${search_input_on_header}
    Click Element    ${search_button_on_header}
    Wait Until Page Does Not Contain Element    ${mask}
    Wait Until Page Contains Element    ${searh_term_warning}
    #Wait Until Page Contains Element    ${search_all_button_on_summay_view}
    #Click Element    ${search_all_button_on_summay_view}
    ${search_in_locator}=    Locator for search inside '${Object_type}'
    Wait Until Page Contains Element    ${search_in_locator}
    Wait Until Element Is Visible    ${search_in_locator}
    Wait for Page Elements Load        
    Click Element    ${search_in_locator}
    Wait Until Page Contains Element    ${search_input_on_results_view}
    Wait for Page Elements Load
    Click Element    ${search_input_on_results_view}
    Input Text    ${search_input_on_results_view}    ${query}
    Click Element    ${search_input_on_results_view}
    Wait Until Element Is Enabled    ${search_button_on_results_view}
    Wait for Page Elements Load    
    Click Element    ${search_button_on_results_view}
    Wait Until Page Contains Element    ${search_result_header}    timeout=30
    Wait Until Page Contains    ${query}    error=${ObjectType}: ${query} was not found
    [Teardown]    Visualize keyword result    Search in '${ObjectType}' for '${query}'
    
Search in '${ObjectType}' for '${query}' no confirm
    [Documentation]    CPQ Quotes search results, Quote Link field is empty
    ...     no confirm for results when open Quote
    Wait Until Page Contains Element    ${search_input_on_header}
    Click Element    ${search_button_on_header}
    Wait Until Page Contains Element    ${searh_term_warning}
    Wait Until Page Contains Element    ${search_all_button_on_summay_view}
    Click Element    ${search_all_button_on_summay_view}
    ${search_in_locator}=    Locator for search inside '${Object_type}'
    Wait Until Page Contains Element    ${search_in_locator}
    Wait Until Element Is Visible    ${search_in_locator}
    Wait for Page Elements Load        
    Click Element    ${search_in_locator}
    Wait Until Page Contains Element    ${search_input_on_results_view}
    Wait for Page Elements Load
    Click Element    ${search_input_on_results_view}
    Input Text    ${search_input_on_results_view}    ${query}
    Click Element    ${search_input_on_results_view}
    Wait Until Element Is Enabled    ${search_button_on_results_view}
    Wait for Page Elements Load    
    Click Element    ${search_button_on_results_view}
    Wait Until Page Contains Element    ${search_result_header}    timeout=30
    #Wait Until Page Contains    ${query}    error=${ObjectType}: ${query} was not found
    [Teardown]    Visualize keyword result    Search in '${ObjectType}' for '${query}'
    
    
Open '${object_type}' with name '${query}'
    Run Keyword And Return If    '${object_type}' == 'Opportunity'    Open Oppty by Namme    ${query}
    ${plural_object_type}=    Get Single Or Plural    ${object_type}
    Search in '${plural_object_type}' for '${query}'
    ${locator_for_drill_to}    Locator for '${object_type}' with '${query}' in search results
    Wait Until Page Contains Element    ${locator_for_drill_to}
    Click Element    ${locator_for_drill_to}
    Wait Until Page Contains    ${query} 
    [Teardown]    Visualize keyword result    Open '${object_type}' with name '${query}'

Open '${object_type}' with name '${query}' for edit no confirm
    [Documentation]    it is mess. solve when quote search is showing quote link
    ${plural_object_type}=    Get Single Or Plural    ${object_type}
    Search in '${plural_object_type}' for '${query}' no confirm
    ${locator_for_drill_to}    Locator for '${object_type}' with '${query}' in search results
    Wait Until Page Contains Element    ${link_edit}
    Click Element    ${link_edit}
    Wait Until Page Contains    ${query} 
    [Teardown]    Visualize keyword result    Open '${object_type}' with name '${query}' for edit

Open SFDC object by ID
    [Arguments]    ${ID}
    Go To    ${BASE_URL}/${ID}
    Wait for Page Elements Load

Open Oppty by Namme
    [Arguments]    ${name}
    ${id}    Get Oppty ID by Name    ${name}
    Go To    ${BASE_URL}/${id}
    Wait Until Page Contains    ${name} 
    
Open Contact by Account Name and Contact Name
    [Arguments]    ${account name}    ${contact name}
    ${id}    Get Contact ID by Account Name and Contact Name    ${account name}    ${contact name}
    Go To    ${BASE_URL}/${id}
    Wait Until Page Contains    ${contact name} 
       
    
    

    
    