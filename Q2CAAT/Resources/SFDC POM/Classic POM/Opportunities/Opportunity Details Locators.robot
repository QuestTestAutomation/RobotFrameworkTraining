*** Settings ***
Library    String   

*** Variables ***
${page_type_locator}          //h1[@class="pageType"]
${oppty_name_loacator}        //h2[@class="pageDescription"]
${create_quote_button}        //input[@value="Create Quote"]
${new oppty button}           //input[@value="New Oppty"]
${oppty page type}            //h1[@class="pageType" and text() = "Opportunity"]

*** Keywords ***
Locator for value of ${property} of Oppty
    ${loc}    Catenate    SEPARATOR=   //div[@class="pbSubsection"]//td[@class="labelCol"]//*[text() ="    ${property}    "]/../following-sibling::td/div
    [Return]    ${loc}