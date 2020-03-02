*** Settings ***
Resource        ../../Resources/Commons/Global Setup.robot
Resource        ../../Resources/SFDC POM/Login/Login.robot
Resource        ../../Resources/Commons/SFDX.robot
Resource        ../../Resources/Commons/SFDC Common Variables.robot
Resource        ../../Resources/SFDC POM/Configure Products/Configure Products.robot
Resource        ../../Resources/SFDC POM/Quotes/Quote Operations.robot
Resource        ../../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Library         ../../Resources/Custom Libs/sku_query_builder.py


*** Variables ***
${NEW_QUOTE_NUMBER}      ${EMPTY}
${NEW_QUOTE_ID}          ${EMPTY}
${PRICE_BOOK}            NAM USD RETAIL PRICING
${PRODUCT_FAMILY}        License    #Professional Services
${SKUs_PER_TEST}         12
@{first slice}           ${EMPTY}
@{second slice}          ${EMPTY}
@{third slice}           ${EMPTY}
@{fourth slice}          ${EMPTY}
@{fifth slice}           ${EMPTY}
@{sixth slice}           ${EMPTY}
@{sevethslice}           ${EMPTY}
@{eighth slice}          ${EMPTY}

    
*** Keywords ***
Local Setup
    #Wait Until Keyword Succeeds    5 times    3 sec    Logout all SFDX orgs
    ${path}    Split Path    ${CURDIR}
    ${path}    Split Path    ${path[0]}
    ${file path}    Catenate    ${path[0]}${/}Resources${/}Files${/}sfdxurl.${SANDBOX}
    Wait Until Keyword Succeeds    5 times    3 sec    SFDX Login to Org    ${file path}    ${SF_USER}[email]    
    #Set Suite Variable    ${BROWSER}    headlesschrome
    Suite Setup
    Wait Until Keyword Succeeds    5 times    3 sec    Login To SFDC sandbox
    Set Four Slices

Set Four Slices
    @{price list}        Wait Until Keyword Succeeds    4x    5 min    Get All SKUs for Price Book '${PRICE_BOOK}' and Family '${PRODUCT_FAMILY}'
    ${price list len}    Get Length    ${price list}
    ${slice len}         Evaluate    ${price list len}//8
    @{price list}    Evaluate    random.sample(${price list}, ${price list len})     modules=random
    log    ${slice len}
    @{first slice}       Get Slice From List    ${price list}    start=0                     end=${slice len}
    @{second slice}      Get Slice From List    ${price list}    start=${${slice len}}       end=${${slice len}*2}
    @{third slice}       Get Slice From List    ${price list}    start=${${slice len}*2}     end=${${slice len}*3}
    @{fourth slice}      Get Slice From List    ${price list}    start=${${slice len}*3}     end=${${slice len}*4}
    @{fifth slice}       Get Slice From List    ${price list}    start=${${slice len}*4}     end=${${slice len}*5} 
    @{sixth slice}       Get Slice From List    ${price list}    start=${${slice len}*5}     end=${${slice len}*6}
    @{seveth slice}      Get Slice From List    ${price list}    start=${${slice len}*6}     end=${${slice len}*7}
    @{eighth slice}      Get Slice From List    ${price list}    start=${${slice len}*7}     end=None
    Set Suite Variable   @{first slice}
    Set Suite Variable   @{second slice}
    Set Suite Variable   @{third slice}
    Set Suite Variable   @{fourth slice}
    Set Suite Variable   @{fifth slice}
    Set Suite Variable   @{sixth slice}
    Set Suite Variable   @{seveth slice}
    Set Suite Variable   @{eighth slice}
    
Create Quote for SKU 
    [Arguments]    ${oppty}
    Open 'Opportunity' with name '${oppty}'
    Run Keyword And Continue On Failure    Create Quote for Oppty '${oppty}'
    log     ${NEW_QUOTE_NUMBER}

Check Products For Quote
    [Arguments]    ${quote name}    ${query string}
    @{expected list}    Split String    ${query string}    ${SPACE}OR${SPACE}
    @{actual list}    Get Product Names of QuoteLines for Quote '${quote name}'
    List Should Contain Sub List    ${actual list}    ${expected list}    msg=Some products were not added to the Quote
    
Add SKUs to Quote
    [Arguments]    ${sku query}
    Go To Configure Products Page
    All SKU Add Products by Codes  ${sku query}
    #Product rules hook
    ##Set all Subscription Terms with '0' to '12'
    #Fix Subscription Term values for YR Products
    @{amounts}=    Get Amounts and Quantities    ${sku query}
    FOR    ${amount}    IN     @{amounts}
           @{columns}=    Split String    ${amount}    separator=,
           Run Keyword If    '${columns}[0]' == '${EMPTY}'    Set List Value    ${columns}    0    0
           Run Keyword If    '${columns}[1]' == '${EMPTY}'    Set List Value    ${columns}    1    0
           ${quantity}=    Set Variable If    ${columns}[0] == 0             @{columns}[1]    @{columns}[0]
           ${quantity}=    Set Variable If    ${quantity} == 0    1    ${quantity}
           Run Keyword If   ${quantity} > 1     Set Product Quantity    ${columns}[4]    ${quantity}
    END
    Save Products 
    
All SKU Add Products by Codes 
    [Arguments]    ${codes_string}
    Open Product Selection Page
    Close Product Filter Panel If Open
    ${query}=    Build Search Query fro Prodcuts by Codes    ${codes_string}
    sleep    1
    Input Text    ${search_products_textbox}    ${query}
    sleep    1
    Click Element    ${search_button}
    Wait Until Page Contains Element    ${spinner_is_hidden}
    sleep    2
    Element Should Be Visible     ${results naumber span}    message=No products matching '${codes_string}' query was found     
    Click Element    ${select_all_results_checkbox}
    Click Element    ${select_button}
    Wait Until Page Contains Element    ${spinner_is_hidden}
    #Check first Mandatory Professional Services option for all Bundles    ${codes_string}
    #Check first Mandatory Professional Services option
    Save on Configure Products Page
    Continue on Alert
    Check for Error Popup
    Page Should Not Contain Element    ${error toast}    loglevel=NONE    message=Error on save product
    Wait Until Page Contains Element    ${add_products_button}    error=Page did not returned to 'Add Products' page
       
    