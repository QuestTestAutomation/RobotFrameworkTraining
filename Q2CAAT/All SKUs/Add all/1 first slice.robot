*** Settings ***
Resource        shared keywords.robot
Suite Setup     Local Setup
Test Teardown   Test Teardown
Force Tags      sku_add

*** Test Cases ***
Check SKU
    Log    ${SKUs_PER_TEST}
    ${queries}    Build Sku Query By Product Name    ${first slice}    split_by=${SKUs_PER_TEST}
    Set Suite Variable    ${TEST OPPTY 1}    SKU#1 - Gennady Borodin - GB NAM SKU GENEX TECHNOLOGIES INC - Oppty-3544667
    Should Not Be Empty    ${queries}    
    FOR    ${query}    IN    @{queries}
       Log    ${query}
       Run Keyword And Continue On Failure    Wait Until Keyword Succeeds    5 times    15 sec    Create Quote for SKU    ${TEST OPPTY 1}    
       Run Keyword And Continue On Failure    Add SKUs to Quote   ${query}
       Run Keyword And Continue On Failure    Check Products For Quote    ${NEW_QUOTE_NUMBER}    ${query}
    END
