*** Setting ***
Resource    ../../Commons/Global Setup.robot
Resource    Quote Lines Locators.robot
Resource    Quote Lines Operations.robot
Resource    ../Common Elements/Details Page.robot
Library     DateTime


*** Keywords ***

Current Page is Quote Line
    Wait Until Page Contains Element    ${quote line page type}
    Element Text Should Be    ${quote line page type}    Quote Line      
    [Teardown]    Visualize keyword result    Current Page is Quote Line Details Page

Quote Line Types Picklist Should Exact Match
    [Arguments]    @{expected line types}
    Log Many    @{expected line types}
    Current Page is Quote Line
    ${line types selector}=    Universal locator for Quote Line property 'Line Types'
    Double Click Element     ${line types selector}
    ${line type selector}=    Catenate    SEPARATOR=    ${line types selector}    //select
    Wait Until Page Contains Element    ${line type selector}    timeout=5    error=Line Types selector does not exsit on the page
    ${actual line types}=    Get List Items    ${line type selector}
    Lists Should Be Equal    ${actual line types}    ${expected line types}    msg=Quote Line Types Picklist contains unexpected values
    
Check Quote Line '${date filed}' is Today
    ${quote_start_date}=    Details Page.Get value of property '${date filed}' from section 'Subscription Information'
    ${quote_start_date}=    Convert Date    ${quote_start_date}    date_format=%m/%d/%Y
    ${today}=               Get Current Date    result_format=%m/%d/%Y
    ${today}=               Convert Date    ${today}    date_format=%m/%d/%Y
    Should Be Equal    ${today}    ${quote_start_date}    Quote Start Day is not today. Actual date is ${quote_start_date}
    [Teardown]    Visualize keyword result    Check Quote Start Day is Today

Check Quote Line '${date field}' from '${section}' is to '${days}' days from '${start date}'
    ${quote_start_date}=    Details Page.Get value of property '${start date}' from section '${section}'
    ${quote_start_date}=    Convert Date    ${quote_start_date}    date_format=%m/%d/%Y
    ${quote_end_date}=      Details Page.Get value of property '${date field}' from section '${section}'
    ${quote_end_date}=      Convert Date    ${quote_end_date}    date_format=%m/%d/%Y
    ${days}    Evaluate     str(int(${days}))
    ${expected_end_date}=   Add Time To Date    ${quote_start_date}    ${days} days
    Should Be Equal    ${quote_end_date}    ${expected_end_date}      Quote End Date is not to '${days}' from start date
    [Teardown]    Visualize keyword result    Check Quote Effective Through End Date is to '${days}' from Start Date


    
    
    

