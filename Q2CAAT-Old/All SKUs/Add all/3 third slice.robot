*** Settings ***
Resource        shared keywords.robot
Suite Setup     Local Setup
Test Teardown   Test Teardown
Force Tags      sku_add

*** Test Cases ***
Check SKU
    Log    ${SKUs_PER_TEST}
    ${queries}    Build Sku Query By Product Name    ${third slice}    split_by=${SKUs_PER_TEST}
    Set Suite Variable    ${TEST OPPTY 3}    #SKU#3 - Gennady+Borodin+Manual Commercial Account Creation - NAM - License - 3498372
    Should Not Be Empty    ${queries}
    FOR    ${query}    IN    @{queries}
       Log    ${query} 
       Run Keyword And Continue On Failure    Wait Until Keyword Succeeds    5 times    15 sec    Create Quote for SKU    ${TEST OPPTY 3} 
       Run Keyword And Continue On Failure    Add SKUs to Quote   ${query}
       Run Keyword And Continue On Failure    Check Products For Quote    ${NEW_QUOTE_NUMBER}    ${query}
    END   
