*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    ../Opportunities/Oppties Validations.robot
Resource    ../Common Elements/Lookup.robot
Resource    ../Configure Products/Configure Products.robot
Resource    ../Quote Lines/Quote Lines Locators.robot


*** Keyword ***

Open Quote Line for '${product code}'
    ${loc}=    Locator of Quote Line link with product code '${product code}'
    Click Element    ${loc}
    Wait Until Page Contains Element    ${quote line page type}  

Open Edit Screen for current Quote Line 
    Wait Until Page Contains Element    ${quote line page type}
    Click Button    ${edit_button}
    Wait Until Element Contains    ${quote line page type}    Quote Line Edit    
    
Delete Quote Line for '${product code}'
    ${loc}=    Locator for Del Quote Line item ${product code}
    Click Element	${loc}
    Handle Alert    timeout=10 s
    Wait for Page Elements Load
    Element Should Not Be Visible    ${error_mesage}    
    Wait Until Page Contains Element    ${edit_button}

Delete All Professional Services Quote Lines
    ${loc}=    Catenate    SEPARATOR=	//div[@class="pbHeader"][.//h3[contains(text(), "Quote Lines")]]/following-sibling::div[@class="pbBody"]//tr[.//td[contains(@class, "dataCell") and text() = "Professional Services"]]
    ${count element}=    Get Element Count    ${loc}
    ${loc element}=    Catenate    SEPARATOR=    ${loc}    [1]/td[3]
    : FOR    ${index}    IN RANGE    ${count element}
	\    log    ${index} 
    \    ${product code}    Get Text    ${loc element}
    \    Run Keyword IF    "${product code}"!="${EMPTY}"    Delete Quote Line for '${product code}'

