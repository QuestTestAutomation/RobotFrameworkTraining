*** Settings ***
Library    String   

*** Variables ***
${quote line page type}        //h1[@class="pageType"][text()= "Quote Line"]
${edit_button}                 //input[@title="Edit"]
${quote line page type}        //h1[@class="pageType"]


*** Keywords ***
Locator for value of '${property}' of Quote Line from section '${section}'
    ${loc_head}=            Catenate    SEPARATOR=    //div[contains(@class, "pbSubheader")]//h3[text()="
    ${loc_tail}=            Catenate    SEPARATOR=    ")]/following-sibling::td[1]
    ${section_locator}=     Catenate    SEPARATOR=    ${loc_head}    ${section}    "]/../following-sibling::div[@class="pbSubsection"]
    ${condition_locator}=   Catenate    SEPARATOR=    //td[contains(@class, "labelCol") and (text() ="    ${property}    " or *//text() ="    ${property} 
    ${property_locator}=    Catenate    SEPARATOR=    ${section_locator}    ${condition_locator}   ${loc_tail}
    [Return]    ${property_locator}
    
Universal locator for Quote Line property '${property}'
    ${loc}    Catenate    SEPARATOR=    //table[@class='detailList']//tr/td[.//text()='    ${property}    ']/following-sibling::td[1]
    [Return]    ${loc}

 