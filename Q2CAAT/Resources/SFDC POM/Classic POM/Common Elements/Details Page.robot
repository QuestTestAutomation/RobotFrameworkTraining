*** Setting ***
Resource    ../../../Commons/Global Setup.robot

*** Variable ***
${edit button}        //input[@name="edit"]
${save button}        //input[@name="save"]


*** Keywords ***
'${screen name}' property '${property}' should conatin '${expected_value}'
    ${js_locator}=        Universal locator for property '${property}' text
    Page Should Contain Element    ${js_locator}    message=Quote details page does not contain '${property}' property    loglevel=NONE
    ${js_locator_text}=        Catenate    SEPARATOR=    ${js_locator}    //text()
    ${actual_value}       Execute Javascript    return window.document.evaluate("${js_locator_text}", document, null, XPathResult.STRING_TYPE, null).stringValue;
    Should Contain Any    ${actual_value}    ${expected_value}    msg=Proprerty '${property}' should contain '${expected_value}'. Actual value '${actual_value}'
    [Teardown]    Visualize keyword result    Quote Property '${property}' should conatin '${expected_value}'    ${js_locator}

'${property}' Checkbox is '${is_checked}'
    ${js_locator}=      Locator for boolean property '${property}'
    ${actual_value}=    Execute Javascript    return window.document.evaluate("${js_locator}", document, null, XPathResult.STRING_TYPE, null).stringValue;
    ${actual_value}=    Replace String Using Regexp    ${actual_value}    [\\r\\n\\xc2\\xa0]    ${EMPTY}
    Should Be Equal    ${actual_value}    ${is_checked}    msg='${property}' should be checked. Actual state is '${actual_value}'  
    [Teardown]    Visualize keyword result    Quote '${property}' Checkbox is '${is_checked}'    ${js_locator} 

Scroll '${property}' into view
    ${js_locator}=        Universal locator for property '${property}' text
    Scroll To Element    ${js_locator}

Get value of property '${property}' from section '${section}'
    ${property_locator}=    Value locator of '${property}' from section '${section}'
    ${value}=    Get Text    ${property_locator}
    [Return]    ${value}
    [Teardown]    Visualize keyword result    Get property '${property}' from section '${section}'    ${property_locator}

Property '${property}' of section '${section}' is NOT EMPTY
    ${value}=    Details Page.Get value of property '${property}' from section '${section}'
    Should Match Regexp    ${value}    \\S    msg=Property '${property}' of section '${section}' is EMPTY    

Value locator of '${property}' from section '${section}'
    ${loc_head}=            Catenate    SEPARATOR=    //div[contains(@class, "pbSubheader")]//h3[text()="
    ${loc_tail}=            Catenate    SEPARATOR=    ")]/following-sibling::td[1]
    ${section_locator}=     Catenate    SEPARATOR=    ${loc_head}    ${section}    "]/../following-sibling::div[@class="pbSubsection"]
    ${condition_locator}=   Catenate    SEPARATOR=    //td[contains(@class, "labelCol") and (text() ="    ${property}    " or *//text() ="    ${property} 
    ${property_locator}=    Catenate    SEPARATOR=    ${section_locator}    ${condition_locator}   ${loc_tail}
    [Return]    ${property_locator}

    
Get value of '${property}'
    ${property_locator}=    Universal locator for property '${property}' text
    #${property_locator}=    Mian Section locator of ${property}
    ${value}=    Get Text    ${property_locator}
    [Return]    ${value}
    [Teardown]    Visualize keyword result    Get '${property}'   ${property_locator} 

Mian Section locator of ${property}    
    ${loc}    Catenate    SEPARATOR=   //div[@class="pbSubsection"]//td[@class="labelCol"][text() ="    ${property}    "]/following-sibling::td/div
    [Return]    ${loc}


Universal locator for property '${property}' text
    ${loc}    Catenate    SEPARATOR=    //table[@class='detailList']//tr/td[.//text()='    ${property}    ']/following-sibling::td[1]
    [Return]    ${loc}

Locator for boolean property '${property}'
    ${loc}    Catenate    SEPARATOR=    //table[@class='detailList']//tr/td[.//text()='    ${property}    ']/following-sibling::td[1]//img/@alt
    [Return]    ${loc}
    
Locator for propertie '${property}' in IFrames on Detail Page
    ${loc}    Catenate     SEPARATOR=    //td[@id="lookup-lable"][contains(.,'${property}')]/following-sibling::td[1]
    [Return]    ${loc}
    
Property '${property}' from IFrame with '${part of id}' in ID should contain '${expected value}'
    ${loc}    Locator for propertie '${property}' in IFrames on Detail Page
    Select frame  //iframe[contains(@id,'${part of id}')]
    ${actual value}    Get Text    ${loc}
    Unselect Frame
    Should Contain Any    ${actual value}    ${expected value}    msg=IFrame Proprerty '${property}' should contain '${expected_value}'. Actual value '${actual_value}'

Lookup in IFrame in property '${property}' for '${value}'
    ${loc}    Locator for propertie '${property}' in IFrames on Detail Page
    Double Click Element    ${loc}
    
Get Current Object Name
    ${quote_number}=    Get Text    //div[@class="ptBody"]//h2
    [Return]    ${quote_number.strip()}

Get Current Object ID
    ${link}=    Get Element Attribute    ${edit button}    onclick
    log    ${link}
    ${id}=      Get Regexp Matches    ${link}    \\('\\/(.*)\\/    1
    [Return]    ${id[0]}

Select in '${property}' value '${value}'
    ${loc}    Universal locator for property '${property}' text
    ${loc}    Catenate    SEPARATOR=    ${loc}    //select
    Select From List By Value    ${loc}    ${value}

Save Edited Object
    Wait Until Page Contains Element    ${save button}    
    Click Element                       ${save button}
    Wait Until Page Contains Element    ${edit button}        
    
   
   