*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    POM Workarounds.robot
Resource    ../../../Lightning Tests/Lightning Suite Commons.robot
Library     SeleniumLibrary
Library     Collections        


*** Variables ***
${new button}                     //div[contains(@class, "windowViewMode-normal")]//li[contains(@class, "slds-button")]//a[@title="New"]
${record type next button}        //div[@class="inlineFooter"]//button[.="Next"]
${close modal dialog button}      //button[@title="Close this window"]
${record type selector}           //div[@class="changeRecordTypeRow"]
${new object panel header}        //div[contains(@class, "oneRecordActionWrapper")]//h2
${object actions drop down}       //div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, "primaryFieldRow")]//div[contains(@class, 'actionsContainer')]//*[@data-key="down"]/../..    #/ancestor-or-self::a    #//div[contains(@class, 'windowViewMode-normal')]//div[contains(@class, 'actionsContainer')]//li[contains(@class, 'ActionsDropDown')]
${save button}                    //div[@class="inlineFooter"  or contains(@class, "modal-footer")]//button[.="Save"]
${modal dialog}                   (//div[contains(@class, "oneRecordActionWrapper isModal") and contains(@class, "active") ] | //div[contains(@class, "uiModal") and @aria-hidden="false"])
${entity type name}               //div[contains(@class, "windowViewMode-normal oneContent active lafPageHost")]//div[contains(@class, "entityNameTitle")]
${quick filter button}            //div[contains(@class, "windowViewMode-normal")]//button[@title="Show quick filters"]
${apply filter button}            //form[contains(normalize-space(.//h2//text()), "Quick Filters")]//button[@title="Apply"]


*** Keywords ***
Wait and Click Element
    [Arguments]    ${locator}    ${modifier}=False   ${action_chain}=False            
    Wait Until Page Contains Element    ${locator}
    Click Element                       ${locator}    ${modifier}    ${action_chain}             

Loc for Textarea Field
    [Arguments]    ${field name}
    #${loc}    Catenate    //div[contains(@class, "modal-container")]//div[@class="inputHeader"]//*[.="${field name}"]/../../..//div[@class="bBody"]//textarea
    ${loc}    Catenate    (//div[@class="bBody"][.//div[@class="inputHeader"]//*[.="${field name}"]] |((//div[@force-recordlayoutitem_recordlayoutitem] | //div[@role="listitem"] | //lightning-textarea)[.//label[.="${field name}"]]))//textarea
    [Return]    ${loc} 

Loc for New Object Dialog Header
    [Arguments]    ${object}
    ${loc}    Catenate    SEPARATOR=   //div[contains(@class, "modal-body")]//*[.="New ${object}"]
    [Return]    ${loc}

Loc for Tex Box Item
    [Arguments]    ${label}
    ${loc}    Catenate   SEPARATOR=     (//div[@role="listitem"]//*[text()="${label}"]//ancestor-or-self::div[contains(@class,"uiInput")][1] | (//div[contains(@class, "flowruntime-input")] | //lightning-lookup-desktop | //lightning-input)[.//*[text()="${label}"]])//input   #//div[@role="listitem"]//*[.="${label}"]//ancestor::div[1]//input    #//div[@data-aura-class="forceDetailPanelDesktop"]//div[@role="listitem"]//*[.="${label}"]/../../input
    [Return]    ${loc}

Loc for Look Up Item
    [Arguments]    ${label}
    ${loc}    Catenate    SEPARATOR=    //div[contains(@class, "forceSearchInputLookupDesktop")]//*[.="${label}"]//ancestor-or-self::div[contains(@class, "forceSearchInputLookupDesktop")]
    [Return]    ${loc} 
    
    
Loc for Record Field Value
    [Arguments]    ${field name}   
    ${loc}    Catenate   SEPARATOR=    //force-record-layout-item[@role="listitem"]//div[contains(@class, "slds-form-element__label")]//*[.="${field name}"]//ancestor-or-self::*[@role="listitem"]//slot[@slot="outputField"]
    [Return]    ${loc}

Loc for Record Tab
    [Arguments]    ${tab name}
    ${loc}    Catenate   SEPARATOR=    //ul[@role="tablist"]//li[@title="${tab name}"]
    [Return]    ${loc}
    
Expand Action Menu and Click Item
    [Arguments]    ${action}
    Wait Until Page Contains Element         ${object actions drop down}
    ${current location}     Get Location
    Wait Until Element Is Visible            ${object actions drop down}    
    sleep    2 
    Click Element                            ${object actions drop down}    #action_chain=True
    ${loc}    Catenate                       //a//*[.="${action}"]//ancestor-or-self::a    #//div[contains(@class, "actionMenu")]//li//a[*="${action}"]     #//a//*[.="${action}"]//ancestor-or-self::a
    sleep    1
    Page Should Contain Element              ${loc}        message=No "${action}" item has been found in the action menu. Object URL: ${current location}   
    Scroll To Element JS                     ${loc}
    Async JS Click                           ${loc} 

Layout Should not Contain Action Menu Item
    [Arguments]    ${action}
    Wait Until Page Contains Element         ${object actions drop down}
    ${current location}     Get Location
    Wait Until Element Is Visible            ${object actions drop down} 
    sleep    2 
    Click Element                            ${object actions drop down}    #action_chain=True
    ${loc}    Catenate                       //div[@role="menu" and @class="branding-actions actionMenu"]//li[.//a[@title="${action}"]]    #//div[contains(@class, "actionMenu")]//li//a[@title="${action}"]
    sleep    1
    Page Should Not Contain Element          ${loc}        message=Layout contains "${action}" Action Menu Item, but should not. Object URL: ${current location}   

Click Action Button
    [Arguments]    ${button}
    ${loc}    Catenate                  //div[contains(@class, "windowViewMode-normal")]//*[contains(@class, "slds-button")]//*[.="${button}"]//descendant-or-self::*[@role="button"]    #//*[contains(@class, "slds-button")]//*[.="${button}"]
    Scroll Element Into View            ${loc}    
    Wait Until Page Contains Element    ${loc}  
    Click Element                       ${loc}
    
Click Field Link
    [Arguments]    ${field name}
    ${loc}    Catenate                  //div[contains(@class, "windowViewMode-normal")]//div[contains(@class, "slds-form-element")][.//span[@class="test-id__field-label" and text()="${field name}"]]//slot[@slot="outputField"]//a 
    Wait Until Page Contains Element    ${loc} 
    Wait Until Element Is Visible       ${loc}
    Scroll Element Into View            ${loc}                #INSTEAD OF Scroll To Element JS                ${loc}    
    Click Element                       ${loc}
    
Go To Create New Record Dialog
    [Arguments]    ${object}    ${record type}=${None}    
    Wait Until Page Contains Element    ${new button}    
    Click Element                       ${new button}
    ${expected header}    Loc for New Object Dialog Header    ${object}
    Run Keyword If    '${record type}' is not '${None}'     Wait Until Page Contains Element    ${expected header}
    sleep    3
    ${if record types enabled}    Get Element Count    ${record type selector}
    Run Keyword If    '${record type}' is '${None}' and ${if record types enabled} > 0    Click Element    ${record type next button}    
    Run Keyword If    '${record type}' is not '${None}'    Select Record Type    ${record type} 
    Wait Until Element Contains    ${new object panel header}    ${object}
 
Select Record Type
    [Arguments]    ${record type}    ${skip for profiles}=${EMPTY}
    @{profiles}    Split String    ${skip for profiles}    ,${SPACE}    
    Return From Keyword If    '${PROFILE}' in ${profiles}    
    ${loc}    Catenate    SEPARATOR=    ${record type selector}   //*[.="${record type}"]//ancestor-or-self::label//input
    Wait Until Page Contains Element    ${loc}    
    Async JS Click    ${loc}
    Capture Page Screenshot
    Click Element    ${record type next button}
    
Insert value in Text Box
    [Arguments]    ${label}    ${value}
    ${loc}    Loc for Tex Box Item    ${label}
    Wait Until Page Contains Element    ${loc} 
    Sleep    1   
    Input Text    ${loc}    ${value}    

Insert text to Textarea Field
    [Arguments]    ${field name}    ${text}
    ${loc}    Loc for Textarea Field    ${field name}
    Input Text    ${loc}    ${text}    
    
    
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
    Wait Until Page Contains Element    //div[contains(@class, "windowViewMode-normal") and contains(@class, "active")]//nav[@role="navigation"][@aria-label="Breadcrumbs"]//*[.="${tab name}"]
    Reload Page
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
    Wait and Click Element                    ${lookup item}//div[@class="listContent"]//ul[@class="lookup__list \ visible"]//li[not(contains(@class, "invisible"))]//div[@title="${value}"]        
    Wait Until Page Contains Element          ${lookup item}//li[@class="pillContainerListItem"]//*[.="${value}"]    

Close Alert Message
    [Arguments]    ${alert snippet text}
    sleep    2
    ${selector}    Catenate   SEPARATOR=    //div[@role="alert" and @data-aura-class="forceToastMessage"][//*[contains(text(), "${alert snippet text}")]]//button[@title="Close"]
    ${count element}=    Get Element Count    ${selector}  
    Run Keyword IF    ${count element}!=0	Click Element    ${selector} 
    
Click Save Button
    Wait Until Page Contains Element            ${save button}
    sleep    2
    Click Element	                            ${save button}
    Wait Until Page Does Not Contain Element    ${modal dialog}
    sleep    2
    
Wait for New Object of type
    [Arguments]    ${type}
    Wait Until Element Contains    ${entity type name}    ${type} 
    sleep    1
    ${new object url}    Get Location 
    Set Test Message     New Object: ${new object url}    append=True
    
Record Field Should Contain Values
    [Arguments]    ${field name}    @{expexcted values}
    ${loc}    Loc for Record Field Value    ${field name}
    Wait Until Page Contains Element    ${loc}      
    ${actual value}    Get Text    ${loc}
    ${actual value}    Remove String Using Regexp    ${actual value}    \\s    
    List Should Contain Value    ${expexcted values}    ${actual value}    msg= '${field name}' does not contain any of '@{expexcted values}' Actual value is '${actual value}'

Wait Until Field Contians Values
    [Arguments]    ${field name}    @{expexcted values}
    Wait Until Keyword Succeeds    30x    2 sec    Record Field Should Contain Values    ${field name}    @{expexcted values}    

Click New Button
    Wait Until Page Contains Element    ${new button}    
    Click Element                       ${new button}

Wait for Modal Dialog
    [Arguments]    ${header}    ${text}
    Wait Until Page Contains Element     //div[contains(@class, "modal-container")]//div[contains(@class, " header")]/*[.="${header}"]
    Wait Until Page Contains Element     //div[contains(@class, "modal-container")]//article//div[@class="content"]//*[normalize-space(text())="${text}"]
    Sleep    1    
    Click Element                        //button[@title="Close this window"]
    
Item Is Checked
    [Arguments]    ${field name}    ${field value}
    ${selector}    Catenate    SEPARATOR=    //div[contains(@class, 'windowViewMode-normal')]//div[@force-recordlayoutitem_recordlayoutitem][.='${field name}']/..//slot[@name='outputField']//input
    ${count element}    Get Element Count    ${selector}
    Run Keyword IF    ${count element}==0    FAIL    Page does not contain element "${field name}"
    ${result}=    Execute Javascript    return window.document.evaluate("${selector}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.checked
    Should Be Equal As Strings 	${field value}	${result} 	ignore_case=True    msg=Expected '${field name}' is set to '${field value}'. Actual value '${result}'

Field Should Be Required
    [Arguments]    ${field name}    ${field value}
    ${selector}    Catenate    SEPARATOR=    (//div[@role='listitem']//*[text()='${field name}']//ancestor-or-self::div[contains(@class,'uiInput')][1] | (//div[contains(@class, 'flowruntime-input')] | //lightning-lookup-desktop | //lightning-input)[.//*[text()='${field name}']])//input
    ${count element}    Get Element Count    ${selector}
    Run Keyword IF    ${count element}==0    FAIL    Page does not contain element "${field name}"
    ${result}=    Execute Javascript    return window.document.evaluate("${selector}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.required
    Should Be Equal As Strings 	${field value}	${result} 	ignore_case=True    msg=Expected required value of '${field name}' is '${field value}'. Actual value '${result}'

Switch to Tab
    [Arguments]    ${tab name}    ${location column}=main    #possible values of ${location column}: main|left|right
    ${location column}    Convert To Lowercase    ${location column}
    #${selector}    Catenate    SEPARATOR=    //div[contains(@class, 'windowViewMode-normal')]//flexipage-record-home-scrollable-column[contains(@class, '${location column}-col')]//lightning-tab-bar//a[normalize-space(text())='${tab name}']
    ${selector}    Catenate    SEPARATOR=    (//flexipage-record-home-scrollable-column[contains(@class, "col ${location column}-col")] | //slot[@slot="${location column}"] | //div[contains(@class,  "region-sidebar-${location column}")]//slot[@slot="sidebar"])[.//ancestor::div[contains(@class, "windowViewMode-normal")]]//lightning-tab-bar//a[normalize-space(text())="${tab name}"]
    ${count element}    Get Element Count    ${selector}
    Run Keyword IF    ${count element}==0    FAIL    Page does not contain tab "${tab name}"
    Scroll Element Into View    ${selector}
    Click Element    ${selector}
    Wait Until Page Does Not Contain Element    //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]
    Wait Until Element Is Enabled               //force-quick-link-container//ul[@force-quicklinkcontainer_quicklinkcontainer]/li

Switch to Record Info Tab
    [Arguments]    ${tab name}    ${slot}=main
    ${loc}    Catenate    SEPARATOR=    //div[contains(@class, "oneContent active")]//slot[@slot="${slot}"]//ul[@role="tablist"]//li[@title="${tab name}"]/a
    Wait Until Page Contains Element    ${loc}
    #${count}    Get Element Count    ${loc}
    Async JS Click    ${loc}
    #Click Element   ${loc}
    Wait Until Page Does Not Contain Element    //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]
    
Open Quick Link
    [Arguments]    ${link name}
    ${selector Show All}    Catenate    SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//div[contains(@class,"forceRelatedListQuickLinksContainer")]//a[starts-with(normalize-space(text()), "Show All")]
    ${count element}    Get Element Count    ${selector Show All}
    Run Keyword IF    ${count element}!=0    Click Element    ${selector Show All}
    Wait Until Page Does Not Contain Element    //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]
    ${selector}    Catenate    SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//div[contains(@class,"forceRelatedListQuickLinksContainer")]//a[starts-with(normalize-space(.//text()), '${link name}')]
    Scroll Element Into View    ${selector}
    Click Element    ${selector}
    Wait Until Element Is Enabled                //div[contains(@class, 'windowViewMode-normal')]//div[@class='forceRelatedListDesktop' and .//h1[@title='${link name}']]//table//tbody
    Wait Until Page Does Not Contain Element     //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]

Expand Action Menu of Related List and Click Item
    [Arguments]    ${related list}    ${action}
    ${selector}    Catenate    SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//article[@data-aura-class="forceRelatedListCardDesktop"][.//header//a//*[@title="${related list}"]]
    Wait Until Page Contains Element         ${selector}         
    ${current location}                      Get Location
    Wait Until Element Is Visible            ${selector}
    Scroll To Element JS                     ${selector}
    ${selector}    Catenate    SEPARATOR=    ${selector}    //div[@data-aura-class="forceDeferredDropDownAction"]//a
    Wait Until Page Contains Element         ${selector}
    Async JS Click                           ${selector}
    ${loc}    Catenate                       //div[@role="menu"]//li//a[@title="${action}"]   #//a//*[.="${action}"]    #//div[contains(@class, "actionMenu")]//li//a[@title="${action}"]
    sleep    1
    Page Should Contain Element              ${loc}        message=No "${action}" item has been found in the action menu. Object URL: ${current location}   
    Set Focus To Element                     ${loc}
    Click Link                            ${loc}

Page Should Contain Related List
    [Arguments]    ${related list}
    ${selector}    Catenate    SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//article[@data-aura-class="forceRelatedListCardDesktop"][.//header//a//*[@title="${related list}"]]
    Wait Until Page Contains Element         ${selector}         
    ${current location}                      Get Location
    Wait Until Element Is Visible            ${selector}
    Scroll To Element JS                     ${selector}
    Capture Page Screenshot
    Page Should Contain Element              ${selector}        message="${related list}" Related List not found. Object URL: ${current location}   

Open Related List
    [Arguments]    ${related list}
    ${selector}    Catenate    SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//article[@data-aura-class="forceRelatedListCardDesktop"]//header//a[.//*[@title="${related list}"]]
    Wait Until Page Contains Element             ${selector}
    Wait Until Element Is Visible                ${selector}
    Wait Until Element Is Enabled                ${selector}
    sleep    2
    Scroll Element Into View                     ${selector}
    Async JS Click                               ${selector}
    #Click Element                                ${selector}
    Wait Until Element Is Enabled                //div[contains(@class, 'windowViewMode-normal')]//div[@class='forceRelatedListDesktop' and .//h1[@title='${related list}']]//table//tbody
    Wait Until Page Does Not Contain Element     //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]

Click Quick Filter Button
    Wait Until Page Contains Element            ${quick filter button}
    Wait Until Element Is Enabled               ${quick filter button}
    Click Element	                            ${quick filter button}
    Wait Until Page Contains Element            //form[contains(normalize-space(.//h2//text()), "Quick Filters")]

Click Apply Filter Button
    Wait Until Page Contains Element            ${apply filter button}
    Wait Until Element Is Enabled               ${apply filter button}
    Click Element	                            ${apply filter button}
    Wait Until Page Does Not Contain Element    //div[contains(@class,"loadingSpinner") and contains(@class,"slds-show")]

Filter:Insert value in Text Box
    [Arguments]    ${label}    ${value}
    ${selector}    Catenate    SEPARATOR=    //form[contains(normalize-space(.//h2//text()), "Quick Filters")]//lightning-input[contains(normalize-space(.//label/text()), "${label}")]//input
    Wait Until Page Contains Element    ${selector} 
    Input Text    ${selector}    ${value}
    
Select value in Combo Box
    [Arguments]    ${label}    ${value}    ${id value}=${EMPTY}
    ${tail}    Set Variable If    '${id value}'=='${EMPTY}'    [1]    [@data-value="${id value}"]
    ${selector}    Loc for Tex Box Item      ${label}
    Wait Until Page Contains Element    ${selector} 
    Input Text                     ${selector}    ${value}  
    Click Element                  ${selector}
    Sleep    1
    ${loc}    Catenate             //lightning-base-combobox-item[.//lightning-base-combobox-formatted-text[@title="${value}"]]${tail}
    Scroll To Element JS           ${loc}
    Click Element                  ${loc} 

Page Should Contain Field
    [Arguments]    ${field name}    ${expected value}=${EMPTY}
    ${selector}    Catenate   SEPARATOR=    //div[contains(@class, "windowViewMode-normal")]//div[@force-recordlayoutitem_recordlayoutitem and contains(@class, "slds-form-element")][.//div[contains(@class, "slds-form-element__label")][.="${field name}"]]//slot[@name="outputField"]//*[@data-output-element-id="output-field"]
    Wait Until Page Contains Element    ${selector}
    Wait Until Element Is Enabled       ${selector}
    Set Focus To Element                ${selector}
    Scroll Element Into View            ${selector}
    sleep    1
    Capture Page Screenshot
    ${actual value}    Get Text    ${selector}
    Run Keyword If    '${expected value}'!='${EMPTY}'    Should Be Equal As Strings    ${expected value}    ${actual value}    msg=Expected '${field name}' is set to '${expected value}'. Actual value '${actual value}'
