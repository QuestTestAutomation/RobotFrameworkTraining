*** Settings ***
Library    String   

*** Variables ***
${quote_page_type_locator}         //h1[@class="pageType"][text()[contains(.,"CPQ Quote")]]
${quote_number_locator}            //h2[@class="pageDescription"]
${edit_button}                     //input[@title="Edit"]
${save_button}                     //input[@title="Save"]
${quote_edit_title}                //h1[text() = "CPQ Quote Edit"]
${error_mesage}                    //div[@id="errorDiv_ep"]
${configure_products_button}       //input[@value="Configure Products"]
${new cpq quote button}            //input[@title="New CPQ Quote"]
${new cpq page title}              //div[@class="bPageTitle"]//h2[text()[contains(., "New CPQ Quote")]]
${get tax info button}             //input[@value="Get Tax Info"] 
${cloud attachment button}         //input[@value="Cloud Attachments"]
${generate document button}        //input[@title="Generate Document"]
${generate and esing button}       //input[@title="Generate & eSign"]
${quote doc agreement title}       //span[.="Quote Document Generation & eSignature"]
${loading mask is hidden}          //div[@ng-show="blockingOperationInProgress" and contains(@class, "ng-hide")]
${preview approval button}         //input[@value="Preview Approval"]
${preview approvals title}         //div[@id="sbPreviewApprovals"]//h1[.="Preview Approvals"]
${edit lines button}               //input[@value="Edit Lines"]
${submit for approval}             //input[@value="Submit for Approval"]


*** Keywords ***
Locator for value of ${property} of Quote    
    ${loc}    Catenate    SEPARATOR=    //div[@class="pbSubsection"]//td[contains(@class, "labelCol") and (text() ="    
    ${loc}    Catenate    SEPARATOR=    ${loc}    ${property}    " or *//text() ="    ${property}    ")]/following-sibling::td[1]
    #${loc}    Catenate    SEPARATOR=   //div[@class="pbSubsection"]//td[@class="labelCol"][text() ="    ${property}    "]/following-sibling::td/div
    [Return]    ${loc}

Locator for value of '${property}' of Quote from section '${section}'
    ${loc_head}=            Catenate    SEPARATOR=    //div[contains(@class, "pbSubheader")]//h3[text()="
    ${loc_tail}=            Catenate    SEPARATOR=    ")]/following-sibling::td[1]
    ${section_locator}=     Catenate    SEPARATOR=    ${loc_head}    ${section}    "]/../following-sibling::div[@class="pbSubsection"]
    ${section_locator}=     Catenate    SEPARATOR=    //div[./h3[text()="${section}"]]/following-sibling::div[@class="pbSubsection"][1]
    ${condition_locator}=   Catenate    SEPARATOR=    //td[contains(@class, "labelCol") and (text() ="    ${property}    " or *//text() ="    ${property} 
    ${property_locator}=    Catenate    SEPARATOR=    ${section_locator}    ${condition_locator}   ${loc_tail}
    [Return]    ${property_locator} 
    
Universal locator for Quote property '${property}' text
    ${loc}    Catenate    SEPARATOR=    //table[@class='detailList']//tr/td[.//text()='    ${property}    ']/following-sibling::td[1]
    [Return]    ${loc}
    
Locator for boolean Quote property '${property}'
    ${loc}    Catenate    SEPARATOR=    //table[@class='detailList']//tr/td[.//text()='    ${property}    ']/following-sibling::td[1]//img/@alt
    [Return]    ${loc}

Lookup locator for '${property}' of Quote from section '${section}'
    ${loc}=               Locator for value of '${property}' of Quote from section '${section}'
    ${lookup_locator}=    Catenate    SEPARATOR=    ${loc}    //a[contains(@title, "Lookup")]
    [Return]    ${lookup_locator}

Table locator for '${property}'
    ${loc_head}=    Catenate    SEPARATOR=    //div[contains(@class, "bRelatedList")]//td[@class="pbTitle"]//h3[text() = "
    ${loc_tail}=    Catenate    SEPARATOR=    "]/ancestor::div[contains(@class, "bPageBlock")]//div[@class="pbBody"]/table
    ${loc}=         Catenate    SEPARATOR=	${loc_head}    ${property}    ${loc_tail}
    [Return]    ${loc}

Locator of Quote Line link with product code '${product_code}'
    ${loc}=    Catenate    SEPARATOR=    //td[contains(@class, "dataCell") and text() = "
    ${loc}=    Catenate    SEPARATOR=    ${loc}    ${product_code}    
    ${loc}=    Catenate    SEPARATOR=    ${loc}    "]/preceding-sibling::*[contains(@class, "dataCell")]/a
    [Return]    ${loc}

Locator for Quote Line item ${product code} Quantity
   ${loc}=    Table locator for 'Quote Lines'
   ${loc}=    Catenate    SEPARATOR=   ${loc}    //tr/td[.="    ${product code}    "]/following-sibling::td[3]
   [Return]    ${loc}
   
Locator for Quote Line item ${product code} Net Total 
   ${loc}=    Table locator for 'Quote Lines'
   ${loc}=    Catenate    SEPARATOR=   ${loc}    //tr/td[.="    ${product code}    "]/following-sibling::td[5]
   [Return]    ${loc}

Locator for Quote Line item ${product code} Total Discount
   ${loc}=    Table locator for 'Quote Lines'
   ${loc}=    Catenate    SEPARATOR=   ${loc}    //tr/td[.="    ${product code}    "]/following-sibling::td[4]
   [Return]    ${loc} 

Locator for Del Quote Line item ${product code}
   ${loc}=    Catenate    SEPARATOR=	//div[@class="pbHeader"][.//h3[contains(text(), "Quote Lines")]]/following-sibling::div[@class="pbBody"]
   ${loc}=    Catenate    SEPARATOR=	${loc}    //tr[.//td[contains(@class, "dataCell") and text() = "    ${product code}    "]]
   ${loc}=    Catenate    SEPARATOR=	${loc}    //a[@class="actionLink" and contains(text(), "Del")]
   [Return]    ${loc} 
    