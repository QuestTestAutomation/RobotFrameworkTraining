*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    Quote Details Locators.robot
Resource    ../Opportunities/Opportunity Details Locators.robot
Library     ../../Custom Libs/Plurals.py
Library     DateTime    

*** Keywords ***
Current Page is CPQ Quote Details Page
    Wait Until Page Contains Element    ${quote_page_type_locator}
    Element Text Should Be    ${page_type_locator}    CPQ Quote
    [Teardown]    Visualize keyword result    Current Page is CPQ Quote Details Page 

Get Current Quote Number
    Current Page is CPQ Quote Details Page
    ${quote_number}=    Get Text    ${quote_number_locator}
    [Return]    ${quote_number.strip()}

Get Current Quote ID
    Current Page is CPQ Quote Details Page
    ${link}=    Get Element Attribute    ${edit_button}    onclick
    log    ${link}
    ${id}=      Get Regexp Matches    ${link}    \\('\\/(.*)\\/    1
    [Return]    ${id[0]}
            
Get property from table 
    [Arguments]    ${table_name}    ${row}    ${column}
    ${locator}=    Table locator for '${table_name}'
    ${value}=      Get Table Cell    ${locator}    ${row}    ${column}
    [Return]    ${value}    
    
Get value of Quote property '${property}'
    ${property_locator}=    Locator for value of ${property} of Quote
    ${value}=    Get Text    ${property_locator}
    [Return]    ${value}
    [Teardown]    Visualize keyword result    Get '${property}'   ${property_locator} 

Get value of property '${property}' from section '${section}'
    ${property_locator}=    Locator for value of '${property}' of Quote from section '${section}'
    ${value}=    Get Text    ${property_locator}
    [Return]    ${value}
    [Teardown]    Visualize keyword result    Get property '${property}' from section '${section}'    ${property_locator}   

Quote Property '${property}' should conatin '${expected_value}'
    ${js_locator}=        Universal locator for Quote property '${property}' text
    Page Should Contain Element    ${js_locator}    message=Quote details page does not contain '${property}' property    loglevel=NONE
    ${js_locator_text}=        Catenate    SEPARATOR=    ${js_locator}    //text()
    ${actual_value}       Execute Javascript    return window.document.evaluate("${js_locator_text}", document, null, XPathResult.STRING_TYPE, null).stringValue;
    Should Contain Any    ${actual_value}    ${expected_value}    msg=Proprerty '${property}' should contain '${expected_value}'. Actual value '${actual_value}'
    [Teardown]    Visualize keyword result    Quote Property '${property}' should conatin '${expected_value}'    ${js_locator}

Quote '${property}' Checkbox is '${is_checked}'
    ${js_locator}=      Locator for boolean Quote property '${property}'
    ${actual_value}=    Execute Javascript    return window.document.evaluate("${js_locator}", document, null, XPathResult.STRING_TYPE, null).stringValue;
    ${actual_value}=    Replace String Using Regexp    ${actual_value}    [\\r\\n\\xc2\\xa0]    ${EMPTY}
    Should Be Equal    ${actual_value}    ${is_checked}    msg='${property}' should be checked. Actual state is '${actual_value}'  
    [Teardown]    Visualize keyword result    Quote '${property}' Checkbox is '${is_checked}'    ${js_locator} 
    
    
Check Quote Start Day is Today
    ${quote_start_date}=    Quotes Validations.Get value of Quote property 'Start Date'
    ${quote_start_date}=    Convert Date    ${quote_start_date}    date_format=%m/%d/%Y
    ${today}=               Get Current Date    result_format=%m/%d/%Y
    ${today}=               Convert Date    ${today}    date_format=%m/%d/%Y
    Should Be Equal    ${today}    ${quote_start_date}    Quote Start Day is not today. Actual date is ${quote_start_date}
    [Teardown]    Visualize keyword result    Check Quote Start Day is Today
    
Check Quote Effective Through End Date is to '${days}' from Start Date
    ${quote_start_date}=    Quotes Validations.Get value of Quote property 'Start Date'
    ${quote_start_date}=    Convert Date    ${quote_start_date}    date_format=%m/%d/%Y
    ${quote_end_date}=      Quotes Validations.Get value of Quote property 'Effective Through End Date'
    ${quote_end_date}=      Convert Date    ${quote_end_date}    date_format=%m/%d/%Y
    ${expected_end_date}=   Add Time To Date    ${quote_start_date}    ${days} days
    Should Be Equal    ${quote_end_date}    ${expected_end_date}      Quote End Date is not to '${days}' from start date
    [Teardown]    Visualize keyword result    Check Quote Effective Through End Date is to '${days}' from Start Date

Quote Currency fields should contain '${currency}'
    Quote Property 'List Amount' should conatin '${currency}'
    Quote Property 'Customer Amount' should conatin '${currency}'
    Quote Property 'Net Amount' should conatin '${currency}'
    Quote Property 'Total' should conatin '${currency}'
    Quote Property 'Addl. Disc. Amount' should conatin '${currency}'

Validate Quote Name for Account '${account_name}'
    ${actual_name}=        Get value of Quote property 'Quote Name'
    ${actual_number}=      Get Current Quote Number  
    ${expected_name}=      Catenate    SEPARATOR=-    ${actual_number}    ${account_name}    Quote
    Should Be Equal As Strings    ${actual_name}    ${expected_name}    msg=Expected Quote name should be '${expected_name}' but actuial value is '${actual_name}'
    [Teardown]    Visualize keyword result    Expected Quote name should be '${expected_name}' but actuial value is '${actual_name}'       
    
Quote Lines Should Contain Product Codes
    [Arguments]    ${product_codes}
    ${product_codes}=    Replace String    ${product_codes}    ,    ;
    ${product_codes}=    Replace String    ${product_codes}    ;    ${SPACE}
    @{list}=    Split String    ${product_codes}
    ${locator}=    Table locator for 'Quote Lines'
    Scroll To Element    ${locator}
    :FOR    ${product_code}    IN    @{list}
    \    Table Column Should Contain    ${locator}    2    ${product_code}    loglevel=NONE

Quote Line for '${product code}' Should Contian '${quantity}' Quantity
    ${loc}=    Locator for Quote Line item ${product code} Quantity
    Element Text Should Be    ${loc}    ${quantity}    

Quote Line for '${product code}' Should Contian '${quantity}' Net Total
    ${loc}=    Locator for Quote Line item ${product code} Net Total
    Element Text Should Be    ${loc}    ${quantity}
    
Quote Line for '${product code}' Should Contian '${discount}' Total Discount
    ${loc}=    Locator for Quote Line item ${product code} Total Discount
    ${actual discount}    Get Text    ${loc}
    ${is close}    Evaluate    math.isclose(${actual discount}, ${discount}, abs_tol=0.3)    modules=math
    Should Be True    '${is close}' == 'True'    msg=Actual Discount '${actual discount}' does not match to expected Disount '${discount}'
       


  