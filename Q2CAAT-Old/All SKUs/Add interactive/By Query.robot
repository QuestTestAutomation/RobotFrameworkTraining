*** Settings ***
Library        Dialogs    
Library        Collections
Library        String
Resource       ../Add all/shared keywords.robot
Suite Setup    Add Interactive Suite Setup
Test Teardown   Test Teardown
Force Tags      sku_add

*** Variables ***
@{products names}    ${EMPTY}

*** Test Cases ***
Add Products
    Login To SFDC sandbox
    Create Quote for SKU    ${TEST_OPPTY}
    FOR     ${product name}    IN     @{products names}
         Open SFDC object by ID    ${NEW_QUOTE_ID}
         Run Keyword And Continue On Failure    Add SKUs to Quote    ${product name}
    END
    
    
*** Keywords ***
Add Interactive Suite Setup
    SFDX Login with Default Credentials
    ${query}=             Get Value From User    Input Query
    @{products names}=    Split String    ${query}    ${SPACE}OR${SPACE}
    Log List    ${products names}
    Set Suite Variable    ${BROWSER}    headlesschrome
    Set Suite Variable    @{products names}    
    
    