*** Settings ***
Resource    ../../../Commons/Global Setup.robot
Resource    ../Opportunities/Oppties Validations.robot
Resource    Quotes Validations.robot
Resource    ../Opportunities/Oppties Validations.robot
Resource    Quote Details Locators.robot
Resource    ../Common Elements/Lookup.robot
Resource    ../Configure Products/Configure Products.robot
Resource    ../Quote Lines/Quote Lines Locators.robot
Resource    ../Common Elements/Cloud Attachments.robot
Resource    ../Approvals/Approvals.robot


*** Keywords ***
Create Quote for Oppty '${oppty_name}'
    Current Opportunity is '${oppty_name}'
    Wait Until Page Contains Element    ${create_quote_button}
    Click Element    ${create_quote_button}
    Wait Until Page Contains    CPQ Quote
    #Wait Until Page Contains    ${quote_page_type_locator}
    ${quote_number}=    Get Current Quote Number
    ${quote_id}=        Get Current Quote ID
    Should Not Be Empty    ${quote_number}    msg=Newly created Quote number is undefined
    Set Test Variable    ${NEW_QUOTE_NUMBER}    ${quote_number}
    Set Test Variable    ${NEW_QUOTE_ID}    ${quote_id}
    Set Test Message    \nCreated Quote: ${quote_number}\n    append=yes
    Set Test Message    \nOppty: ${oppty_name}\n    append=yes
    [Teardown]    Visualize keyword result    Create Quote for Oppty '${oppty_name}'

Simplified Quote creation for Oppty '${oppty_name}'
    Current Opportunity is '${oppty_name}'
    Wait Until Page Contains Element    ${create_quote_button}
    Click Element    ${create_quote_button}
    Wait Until Page Contains    CPQ Quote 

Select value '${value}' for property '${property}' from section '${section}'
    #Current Page is CPQ Quote Details Page
    ${property_locator}=    Locator for value of '${property}' of Quote from section '${section}'
    ${property_locator}=    Catenate    SEPARATOR=    ${property_locator}    //select
    Scroll To Element    ${property_locator}
    Select From List By Value    ${property_locator}    ${value}

Enter value '${value}' in '${property}' text box
    ${loc}=    Universal locator for Quote property '${property}' text
    ${loc}=    Catenate    SEPARATOR=    ${loc}    /input
    Input Text    ${loc}	${value}

Get current value of '${property}' text box
    ${loc}=    Universal locator for Quote property '${property}' text
    ${loc}=    Catenate    SEPARATOR=    ${loc}    /input
    ${current value}    Get Element Attribute    ${loc}    value
    [Return]    ${current value} 

Save Quote
    Page Should Contain Element    ${save_button}    loglevel=INFO    
    Page Should Contain Element    ${quote_edit_title}    loglevel=INFO    
    Click Element    ${save_button}
    Wait for Page Elements Load
    Element Should Not Be Visible    ${error_mesage}    
    Wait Until Page Contains Element    ${edit_button}

Go To Edit Quote screen
    Page Should Contain Element    ${quote_page_type_locator}
    Page Should Contain Element    ${edit_button}
    Click Element    ${edit_button} 
    Wait Until Page Contains Element    ${save_button}
    Wait for Page Elements Load

Lookup '${value}' for '${property}' from section '${section}'
    ${lookup_loactor}=    Lookup locator for '${property}' of Quote from section '${section}'
    Click Element    ${lookup_loactor}
    Lookup for '${value}'

Go To Configure Products Page
    Page Should Contain Element    ${quote_page_type_locator}    loglevel=NONE  
    Click Element    ${edit lines button}     

    
Add products to Quote by Product Codes
    [Arguments]    ${product_codes}
    [Documentation]    
    ...    ``product_codes`` examples
    ...    TOD-TOD-PB, TOD-TOD-PK-3YR
    ...    
    ...    TOD-TOD-PB; TOD-TOD-PK-3YR
    ...    
    Go To Configure Products Page
    Add Products by Codes  ${product_codes}
    Save Products

Add product to Quote with Quatntity
    [Arguments]    ${product code}    ${quantity}
    Go To Configure Products Page
    Add Products by Codes    ${product code}
    Set Product Quantity    ${product code}    ${quantity}

Add product to Quote with Discount
    [Arguments]    ${product code}    ${discount}
    Go To Configure Products Page
    Add Products by Codes    ${product code}
    Set Product Discount    ${product code}    ${discount}
    Save Products
    
    
Go To New Quote Screen
    Wait Until Page Contains Element    ${new cpq quote button}
    Click Element                       ${new cpq quote button}
    Wait Until Page Contains Element    ${new cpq page title}

Get Tax Info
    Page Should Contain Element    ${quote_page_type_locator}
    Page Should Contain Element    ${get tax info button}
    Click Element    ${get tax info button}
    ${tax alert text}=    Handle Alert    action=ACCEPT
    Should Contain    ${tax alert text}    Tax has been updated successfully
    #${matches}    Get Regexp Matches    ${tax alert text}    Success.*=(\\d+.\\d+)    1
    [Return]    Success
    
Go To Cloud Attachments of the Quote
    Wait Until Page Contains Element     ${cloud attachment button}    
    Click Element                        ${cloud attachment button}
    Sleep    5
    #Select Window    NEW

Close Cloud Attachments Window
    Wait Until Page Contains Element    ${choose files button}
    Close Window
    Select Window    MAIN
    
Add Cloud Attachment File '${file}' to the Quote
    ${path}    Split Path    ${CURDIR}
    ${path}    Split Path    ${path[0]}
    ${path}    Split Path    ${path[0]}
    ${file path}    Catenate    ${path[0]}${/}Resources${/}Files${/}${file}
    ${file name}    ${ext}    Split Extension    ${file}
    Select Window    NEW
    Delete Cloud Attachment            ${file name}
    Upload Cloud Attachment            ${file path}
    Check Cloud Attachment Presence    ${file name}
    Close Cloud Attachments Window

Go To Generate Document Page
    Wait Until Page Contains Element    ${generate document button}
    Click Element    ${generate document button}
    #Handle Alert    action=ACCEPT
    Wait Until Page Contains Element    ${loading mask is hidden}    timeout=300

Go To Generate & eSign
    Wait Until Page Contains Element    ${generate and esing button}
    Click Element                       ${generate and esing button}
    Handle Alert    action=ACCEPT
    Wait Until Page Contains Element    ${quote doc agreement title}    timeout=300
    #Wait Until Page Contains Element    ${loading mask is hidden}    timeout=300

Bypass Quote Approval
    Go To Edit Quote screen
    Select value '2 - Approved by Mgmt' for property 'Status' from section 'Information'
    Select value 'Approved' for property 'ApprovalStatus' from section 'Advanced Approvals'
    Save Quote

Go To Preview Approval
    Wait Until Page Contains Element     ${preview approval button}
    Click Element                        ${preview approval button}
    Alert Should Not Be Present          timeout=3 sec
    Wait Until Page Contains Element     ${preview approvals title}
    Page Should Not Contain Element      ${approval error box}    message=Error rised during approvals preview
            
Submit Quote for Approval
    sleep                                     1
    Wait Until Page Contains Element          ${submit for approval button}    
    Click Element                             ${submit for approval button}
    Wait Until Page Contains Element          ${edit_button} 
    Wait Until Page Does Not Contain Element  ${submit for approval button}    