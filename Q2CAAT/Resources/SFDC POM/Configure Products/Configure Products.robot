*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../Quotes/Quote Details Locators.robot
Resource    ../../Commons/Global Setup.robot

*** Variables ***
${add_products_button}                   //paper-button[@id="mainButton"][text()="Add Products"]
${save_products_button}                  //paper-button[@id="mainButton"][text()="Save"]
${product_selection_title}               //h1//*[text()="Product Selection"]
${search_products_textbox}               //div[@id="searchbar"]//input[@placeholder="Search Products"]
${search_button}                         //div[@id="searchbar"]//paper-button[@id="search"]
${select_all_results_checkbox}           //sb-lookup-layout//sb-table-header[@id="header"]//div[@id="checkboxContainer"]
${spinner_is_hidden}                     //sb-page-container[@id="sbPageContainer"]//sf-loading-spinner[@show="true"]//div[@id="mask" and @hidden]
${spinner element}                       //sb-page-container[@id="sbPageContainer"]//sf-loading-spinner
${select_button}                         //paper-button[@id="plSelect"]//*[text() = "Select"]/..
${filter button}                         //paper-button[@id="fb"]
${product filter title}                  //sb-i18n[text() = "Product Filter"]
${product filter panel}                  //iron-selector//div[@id="drawer"]
${close product filter button}           //iron-selector//div[@id="drawer"]//i[contains(@class, "close")]
${alert dialog}                          //sb-product-alert[@id="productAlertModal"]//div[contains(@class,"style-scope sb-dialog --desktop") and not(@hidden)]
#${alert dialog}                          //div[@device and contains(@class, "groupWrapper ")]//div[@id="alert-title"]
${continue button in alert}              //paper-button[@id="continue" and contains(@class, "sb-product-alert")]
${quote total value}                     //sb-field[@id="quoteTotal"]/descendant::div[text()]
${loading mask}                          //div[@id="mask"]
${configure products title}              //p[@id="title"]//h1[.="Configure Products"]
${save cofigured products button}        //paper-button[@id="pcSave"]
${error toast}                           //div[contains(@class, "toast") and contains(@id, "error")]
${error toast text}                      //div[contains(@class, "toast") and contains(@id, "error")]//h2
${15bs}                                  BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE
${results naumber span}                  //span[@id="numResults"]
${mandatory ps table}                    //sb-product-feature[@name="Mandatory Professional Services" and not(@hidden)]
${bundles panel}                         //sb-side-panel[@side-text="Bundles"]
${bundles switcher}                      //sb-side-panel[@side-text="Bundles"]//div[contains(@class, "closedArrows")] 
${bundles container}                     //div[@id="bundleContainer"]



*** Keyword ***
Locator for Product Filter '${filter name}'
    ${loc}    Catenate    SEPARATOR=    //div[text() = "    ${filter name}    "]/..//select
    [Return]    ${loc}
    
Locator for Quantity of '${product code}'
    ${loc}    Catenate   SEPARATOR=    //div[@id="tableContainer"]//div[@id="datatable"]//div[@field="SBQQ__ProductCode__c"]/*[text()="    ${product code}
    ${loc}    Catenate   SEPARATOR=    ${loc}    "]/ancestor-or-self::div[@field="SBQQ__ProductCode__c"]/following-sibling::div[@field="SBQQ__Quantity__c"]
    [Return]    ${loc}
    
Locator for Additional Discount of '${product code}'
    ${loc}    Catenate   SEPARATOR=    //div[@id="tableContainer"]//div[@id="datatable"]//div[@field="SBQQ__ProductCode__c"]/*[text()="    ${product code}
    ${loc}    Catenate   SEPARATOR=    ${loc}    "]/ancestor-or-self::div[@field="SBQQ__ProductCode__c"]/following-sibling::div[@field="SBQQ__AdditionalDiscount__c"]
    [Return]    ${loc}

Locator for Maintenance Start Date of '${product code}'
    ${loc}    Catenate   SEPARATOR=    //div[@id="tableContainer"]//div[@id="datatable"]//div[@field="SBQQ__ProductCode__c"]/*[text()="    ${product code}
    ${loc}    Catenate   SEPARATOR=    ${loc}      "]/ancestor-or-self::div[@field="SBQQ__ProductCode__c"]/following-sibling::div[@field="Maintenance_Start_Date__c"]
    [Return]    ${loc}

Locator for Subscription Term of '${product code}'
    ${loc}    Catenate   SEPARATOR=    //div[@id="tableContainer"]//div[@id="datatable"]//div[@field="SBQQ__ProductCode__c"]/*[text()="    ${product code}
    ${loc}    Catenate   SEPARATOR=    ${loc}      "]/ancestor-or-self::div[@field="SBQQ__ProductCode__c"]/following-sibling::div[@field="SBQQ__SubscriptionTerm__c"]
    [Return]    ${loc}

Build Search Query fro Prodcuts by Codes
    [Arguments]    ${codes_string}
    ${query}=    Replace String    ${codes_string}    -    ${EMPTY}
    ${query}=    Replace String    ${query}    ,${SPACE}    ${SPACE}OR${SPACE}
    ${query}=    Replace String    ${query}    ;${SPACE}    ${SPACE}OR${SPACE}
    ${query}=    Catenate    SEPARATOR=    (   ${query}    )
    [Return]     ${query}

Insert value to Product field
    [Arguments]    ${field locator}    ${value}
    Scroll To Element    ${field locator}
    Click Element    ${field locator}
    Sleep    1
    Click Element    ${field locator}
    Wait Until Page Contains Element    ${field locator}//input    timeout=3    error=No input to the field allowed 
    Press Keys    ${field locator}//input    END
    Press Keys    ${field locator}//input    ${15bs}
    Press Keys    ${field locator}//input    ${value}
    Press Keys    ${field locator}//input    RETURN
    Wait Until Page Contains Element    ${spinner_is_hidden}
    sleep    2
    Page Should Not Contain Element    ${error toast}    message=Failed to insert '${value}'. Please see log    

Add Products by Codes 
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
    Check first Mandatory Professional Services option for all Bundles    ${codes_string}
    #Check first Mandatory Professional Services option
    Save on Configure Products Page
    Continue on Alert
    Check for Error Popup
    Page Should Not Contain Element    ${error toast}    loglevel=NONE    message=Error on save product
    Wait Until Page Contains Element    ${add_products_button}    error=Page did not returned to 'Add Products' page

Set Product Quantity
    [Arguments]    ${product code}    ${quantity}
    Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button
    Wait Until Page Contains Element    ${spinner_is_hidden} 
    ${loc}=    Locator for Quantity of '${product code}'
    Insert value to Product field    ${loc}    ${quantity}
    

# do not repeat yourself 
Set Product Discount
    [Arguments]    ${product code}    ${discount}
    Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button
    Wait Until Page Contains Element    ${spinner_is_hidden} 
    ${loc}    Locator for Additional Discount of '${product code}'
    Insert value to Product field    ${loc}    ${discount}
    

Set Product Maintenance Start Date
    [Arguments]    ${product code}    ${start date}
    Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button
    Wait Until Page Contains Element    ${spinner_is_hidden}
    ${loc}    Locator for Maintenance Start Date of '${product code}'
    Insert value to Product field    ${loc}    ${start date} 
    
Set Product Subscription Term
    [Arguments]    ${product code}    ${subscription term}
    Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button
    Wait Until Page Contains Element    ${spinner_is_hidden}
    ${loc}    Locator for Subscription Term of '${product code}'
    ${current term}    Get Subscription Term Value for    ${product code}
    Run Keyword If    '${current term}' != '${subscription term}'    Insert value to Product field    ${loc}    ${subscription term}

Get Subscription Term Value for
     [Arguments]    ${product code}
     Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button
     Wait Until Page Contains Element    ${spinner_is_hidden}
     ${loc}    Locator for Subscription Term of '${product code}'
     ${value}    Get Text    ${loc}
     [Return]    ${value}

Set Subscription Term if 0
    [Arguments]    ${product code}    ${new subscription term}
    ${actual term}    Get Subscription Term Value for    ${product code}
    Run Keyword If    '${actual term}' == '0'    Set Product Subscription Term    ${product code}    ${new subscription term}    

Set all Subscription Terms with '${old}' to '${new}'
    @{product codes with 0}     Get WebElements    //div[@field="SBQQ__SubscriptionTerm__c"]//div[.="${old}"]/../../div[@field="SBQQ__ProductCode__c"]/div
    FOR   ${item}    IN    @{product codes with 0}
        ${product code}    Set Variable    ${item.get_attribute('innerHTML')}
        ${new}    Set Variable If    '${product code}'.find('2YR') != -1     24    ${new}
        ${new}    Set Variable If    '${product code}'.find('3YR') != -1     36    ${new}     
        Set Product Subscription Term    ${product code}    ${new} 
    END

Fix Subscription Term values for YR Products
    @{skus with yr}    Get WebElements    //div[@field="SBQQ__ProductCode__c"]/div[contains(.,"YR")]
    ${new}    Set Variable    0
    FOR    ${item}    IN    @{skus with yr}
        ${product code}    Set Variable    ${item.get_attribute('innerHTML')}
        ${new}    Set Variable If    '${product code}'.find('2YR') != -1    24    ${new}
        ${new}    Set Variable If    '${product code}'.find('3YR') != -1    36    ${new}
        ${new}    Set Variable If    '${product code}'.find('4YR') != -1    48    ${new}
        ${new}    Set Variable If    '${product code}'.find('5YR') != -1    60    ${new}
        ${new}    Set Variable If    '${product code}'.find('6YR') != -1    72    ${new}
        ${new}    Set Variable If    '${product code}'.find('7YR') != -1    84    ${new}
        Set Product Subscription Term    ${product code}    ${new}
    END


Set all Products Discounts to '${discount}'
     @{product codes}     Get WebElements   //div[@field="SBQQ__ProductCode__c"]/div
     FOR   ${item}    IN    @{product codes}
         Set Product Discount    ${item.get_attribute('innerHTML')}    ${discount} 
     END
#Set Product Subscription Term 
Set Products Discounts to '${discount}' for products in '${products}'
    @{product codes}     Get WebElements   //div[@field="SBQQ__ProductCode__c"]/div
     FOR   ${item}    IN    @{product codes}
         ${code}    Set Variable   ${item.get_attribute('innerHTML')}         
         Run Keyword If   '${products}'.find('${code}') != -1    Set Product Discount    ${code}    ${discount} 
     END

Check first Mandatory Professional Services option for all Bundles
    [Arguments]    ${codes_string}
    ${if bundles displayed}    Get Element Count    ${bundles switcher}
    Run Keyword And Return If    ${if bundles displayed} == 0    Check first Mandatory Professional Services option
    @{skus with mandatory options}    Select SKUs with Mandatory options form set    ${codes_string}
    Click Element    ${bundles switcher}
    sleep    1
    FOR    ${sku}    IN    @{skus with mandatory options}
        Click Element    ${bundles panel}//div[@label="${sku}"]
        Wait Until Page Contains Element     ${bundles container}
        Wait Until Element Contains    ${bundles container}    ${sku}
        Check first Mandatory Professional Services option
    END
            


Check first Mandatory Professional Services option
    ${if madatory}    Get Element Count    ${mandatory ps table}
    Return From Keyword If    ${if madatory} == 0
    ${if madatory checked}    Get Element Count    ${mandatory ps table}//div[@id="tbody"]//paper-checkbox[@checked]
    Return From Keyword If    ${if madatory checked} != 0        
    Click Element     ${mandatory ps table}//div[@id="tbody"]//paper-checkbox
    Wait Until Page Contains Element    ${mandatory ps table}//div[@id="tbody"]//paper-checkbox[@checked]    


Quote Total Should Be '${expected quote total}'
    Page Should Contain Element    ${quote total value}
    ${actual quote total}    Get Text    ${quote total value}
    ${actual quote total}    Replace String    ${actual quote total}    ${SPACE}${SPACE}    ${SPACE}
    Should Be Equal As Strings    ${actual quote total}    ${expected quote total}        
    

Save Products
    Click Element    ${save_products_button}
    Wait Until Page Does Not Contain    ${loading mask}
    sleep    3
    Continue on Alert
    Check for Error Popup
    Page Should Not Contain Element    ${error toast}    loglevel=NONE    message=Error on save product
    Wait Until Page Contains Element    ${edit_button}    error=Page did not returned to Quote page 

Open Product Selection Page
    Wait Until Page Contains Element    ${add_products_button}    error=Page does not contain 'Add Products' button    
    Click Element    ${add_products_button} 
    Wait Until Page Contains Element    ${product_selection_title}
    Wait Until Page Contains Element    ${search_products_textbox}    
    Wait Until Page Contains Element    ${spinner_is_hidden} 

Activate Product Filter
    Wait Until Page Contains Element    ${filter button}	error=Page does not contain 'Filter' button
    Click Element    ${filter button}
    Wait Until Page Contains Element    ${product filter title}

Deactivate Product Filter
    Wait Until Page Contains Element    ${product filter title}
    sleep    1
    Click Element    ${close product filter button}

Select in Product Filter '${value}' in '${filter}'
    Wait Until Page Contains Element    ${product filter title}
    ${filter locator}    Locator for Product Filter '${filter}'
    Select From List By Label    ${filter locator}    ${value}

Close Product Filter Panel If Open
    ${panel state}=    Get Element Attribute    ${product filter panel}    class
    Run Keyword If    'iron-selected' in '${panel state}'    Deactivate Product Filter

Open Product Filter Panel If Closed
    ${panel state}=    Get Element Attribute    ${product filter panel}    class
    Run Keyword If    'iron-selected' not in '${panel state}'    Activate Product Filter

Continue on Alert
    #Run Keyword And Ignore Error    Wait Until Page Contains Element    ${continue button in alert}    timeout=30
    #Run Keyword And Ignore Error    Click Element    ${continue button in alert}
    #Wait Until Page Does Not Contain    ${loading mask}
    sleep    5
    #Capture Page Screenshot    
    ${if no alert}    Get Element Count    ${edit_button}
    Return From Keyword If    ${if no alert} > 0
    ${if page contains spinner}    Get Element Count    ${spinner element}
    Run Keyword If    ${if page contains spinner} > 0    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${spinner_is_hidden}    timeout=30
    sleep    1
    ${if alert}    Get Element Count    ${continue button in alert}
    Run Keyword If    ${if alert} > 0    Click Element    ${continue button in alert}

Save on Configure Products Page
    sleep    4
    Wait Until Page Contains Element    ${spinner_is_hidden}
    ${conf products}    Get Element Count    ${configure products title}
    Run Keyword If    ${conf products}>0    Click Element    ${save cofigured products button}

Convert Product Codes query string to List
    [Arguments]    ${query string}
    Split String    ${query string}    ${SPACE}OR${SPACE}
    
Check for Error Popup
    sleep    1
    ${is error toast}    Get Element Count    ${error toast}
    Run Keyword If    ${is error toast} > 0    Report Save Error And Fail

Report Save Error And Fail
    ${error text}     Get Text    ${error toast text}
    Capture Page Screenshot
    Log    ${error text}
    Set Test Message    Can't save product: ${error text}    append=True
    Fail    Can't add product: ${error text}
    
