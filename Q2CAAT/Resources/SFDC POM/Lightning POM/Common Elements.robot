*** Settings ***
Resource    ../../Commons/Global Setup.robot
Library     SeleniumLibrary
Resource    POM Workarounds.robot    


*** Variables ***
${new button}                     link:New
${record type next button}        //div[@class="inlineFooter"]//button[.="Next"]
${close modal dialog button}      //button[@title="Close this window"]
${record type selector}           //div[@class="changeRecordTypeRow"]
${new object panel header}        //div[@data-aura-class="forceDetailPanelDesktop"]//h3[.="Account Information"]
${object actions drop down}       //div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, 'actionsContainer')]//li[contains(@class, 'ActionsDropDown')]
${save button}                    //div[@class="inlineFooter"]//button[.="Save"]
${modal dialog}                   //div[contains(@class, "oneRecordActionWrapper isModal") and contains(@class, "active") ] 
${entity type name}               //div[contains(@class, "windowViewMode-normal oneContent active lafPageHost")]//div[contains(@class, "entityNameTitle")]


*** Keywords ***
Loc for New Object Dialog Header
    [Arguments]    ${object}
    ${loc}    Catenate    SEPARATOR=   //div[contains(@class, "modal-body")]//*[.="New ${object}"]
    [Return]    ${loc}

Loc for Tex Box Item
    [Arguments]    ${label}
    ${loc}    Catenate   SEPARATOR=    //div[@data-aura-class="forceDetailPanelDesktop"]//div[@role="listitem"]//*[.="${label}"]/../../input
    [Return]    ${loc}

Loc for Look Up Item
    [Arguments]    ${label}
    ${loc}    Catenate    SEPARATOR=    //div[contains(@class, "forceSearchInputLookupDesktop")]//*[.="${label}"]//ancestor-or-self::div[contains(@class, "forceSearchInputLookupDesktop")]
    [Return]    ${loc} 
    
Expand Action Menu and Click Item 
    [Arguments]    ${action}
    Wait Until Page Contains Element         ${object actions drop down}
    ${current location}     Get Location
    sleep    2    
    Click Element                            ${object actions drop down}    #action_chain=True
    ${loc}    Catenate                       //div[contains(@class, "actionMenu")]//li//a[@title="${action}"]
    sleep    1
    Page Should Contain Element              ${loc}        message=No "${action}" item has been found in the action menu. Object URL: ${current location}   
    Scroll To Element JS                     ${loc}
    Async JS Click                           ${loc}                 

Click Action Button    
    [Arguments]    ${button}
    ${loc}    Catenate                  //div[contains(@class, "windowViewMode-normal")]//*[contains(@class, "slds-button")]//*[.="${button}"]//descendant-or-self::*[@role="button"]    #//*[contains(@class, "slds-button")]//*[.="${button}"]    
    Wait Until Page Contains Element    ${loc}  
    Click Element                       ${loc}
    
Click Field Link
    [Arguments]    ${field name}
    ${loc}    Catenate                  //div[contains(@class, "windowViewMode-normal")]//div[contains(@class, "slds-form-element")][.//span[@class="test-id__field-label" and text()="${field name}"]]//slot[@slot="outputField"]//a 
    Wait Until Page Contains Element    ${loc} 
    Wait Until Element Is Visible       ${loc}
    Scroll To Element JS                ${loc}    
    Click Element                       ${loc}
    
GoTo Create New Record Dialog
    [Arguments]    ${object}    ${record type}=${None}    
    Wait Until Page Contains Element    ${new button}    
    Click Element                       ${new button}
    ${expected header}    Loc for New Object Dialog Header    ${object}
    Wait Until Page Contains Element    ${expected header}
    ${if record types enabled}    Get Element Count    ${record type selector}
    Run Keyword If    '${record type}' is '${None}' and ${if record types enabled} > 0    Fail    msg=Record type should be specified when '${object}' is created
    Run Keyword If    '${record type}' is not '${None}'    Select Record Type    ${record type} 
    Wait Until Page Contains Element    ${new object panel header}
 
Select Record Type
    [Arguments]    ${record type}
    ${loc}    Catenate    SEPARATOR=    ${record type selector}   //*[.="${record type}"]//input
    Async JS Click    ${loc}
    Capture Page Screenshot      
    Click Element    ${record type next button}
    
Insert value in Text Box
    [Arguments]    ${label}    ${value}
    ${loc}    Loc for Tex Box Item    ${label}
    Wait Until Page Contains Element    ${loc} 
    Sleep    1   
    Input Text    ${loc}    ${value}    
    
Get Value from
    [Arguments]    ${field name}
    Wait Until Page Contains Element    //div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem][.="${field name}"]/..//slot[@name="outputField"]    
    ${val}    Get Text    //div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem][.="${field name}"]/..//slot[@name="outputField"]//descendant-or-self::*[last()]    #//[normalize-space(text())]
    [Return]    ${val}

Field Should Have Value
    [Arguments]    ${field name}    ${expected value}
    ${actual value}    Get Value from    ${field name}
    Should Be Equal As Strings    ${expected value}    ${actual value}    msg=Expected '${field name}' is set to '${expected value}'. Actual value '${actual value}'

GoTo Object Tab
    [Arguments]    ${tab name}
    ${loc}    Catenate    SEPARATOR=    //nav//a[.="${tab name}"]
    Wait Until Page Contains Element    ${loc}
    sleep    1
    Async JS Click     ${loc}
    #Click Element                       ${loc} 
    sleep    1

Wait for New Browser Window with URL
    [Arguments]    ${url} 
    Switch Window              NEW
    Location Should Contain    ${url}    message=No redirecton in new window to '${url}' has happened
    
Select Value in Picklist
    [Arguments]    ${field name}    ${value}
    ${selector}    Catenate   SEPARATOR=   //div[contains(@class, "forceInputPicklist")]//*[.="${field name}"]/ancestor::div[contains(@class, "forceInputPicklist")]//div[@class="uiMenu"]
    Wait Until Page Contains Element    ${selector}    
    Click Element    ${selector}
    Click Link    ${value}

Move Value to Chosen in MultiPickList
    [Arguments]    ${multipicklist name}    ${value to choosen}
    ${multipicklist}    Catenate   SEPARATOR=    //lightning-picklist[@data-aura-class="forceInputMultiPicklist"]//*[.="${multipicklist name}"]//ancestor::lightning-picklist[@data-aura-class="forceInputMultiPicklist"]
    Wait Until Page Contains Element    ${multipicklist}  
    Click Element    ${multipicklist}//li[.="${value to choosen}"] 
    Click Element    ${multipicklist}//button[@title="Move selection to Chosen"] 
    
Move Value to Available in MultiPickList
    [Arguments]    ${multipicklist name}    ${value to available}
    ${multipicklist}    Catenate   SEPARATOR=    //lightning-picklist[@data-aura-class="forceInputMultiPicklist"]//*[.="${multipicklist name}"]//ancestor::lightning-picklist[@data-aura-class="forceInputMultiPicklist"]
    Wait Until Page Contains Element    ${multipicklist}  
    Click Element    ${multipicklist}//li[.="${value to available}"] 
    Click Element    ${multipicklist}//button[@title="Move selection to Available"] 

Select Value in LookUp
    [Arguments]    ${lookup name}    ${value}    
    ${lookup item}    Loc for Look Up Item    ${lookup name}
    Wait Until Page Contains Element          ${lookup item}    
    Press Keys                                ${lookup item}//input    ${value}            
    Wait Until Page Contains Element          ${lookup item}//div[@class="listContent"]//ul[@class="lookup__list \ visible"]//li[not(contains(@class, "invisible"))]
    Click Element                             ${lookup item}//div[@class="listContent"]//ul[@class="lookup__list \ visible"]//li[not(contains(@class, "invisible"))]    #action_chain=True
    Wait Until Page Contains Element          ${lookup item}//li[@class="pillContainerListItem"]//*[.="${value}"]    

Close Alert Message
    [Arguments]    ${alert snippet text}
    sleep    2
    ${selector}    Catenate   SEPARATOR=    //div[@role="alert" and @data-aura-class="forceToastMessage"][//*[contains(text(), "${alert snippet text}")]]//button[@title="Close"]
    ${count element}=    Get Element Count    ${selector}  
    Run Keyword IF    ${count element}!=0	Click Element    ${selector} 
    
Click Save Button
    Wait Until Page Contains Element            ${save button}
    Click Element	                            ${save button}
    Wait Until Page Does Not Contain Element    ${modal dialog}    
    
Wait for New Object of type
    [Arguments]    ${type}
    Wait Until Element Contains    ${entity type name}    ${type} 
    sleep    1
    ${new object url}    Get Location 
    Set Test Message     New Object: ${new object url}    append=True
    
Wait Until Field Contians Value
    [Arguments]    ${field name}    ${value}
    Wait Until Element Contains    //force-record-layout-item[@role="listitem"]//div[contains(@class, "slds-form-element__label")]//*[.="${field name}"]//ancestor-or-self::*[@role="listitem"]//slot[@slot="outputField"]    ${value}      
