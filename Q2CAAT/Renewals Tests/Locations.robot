*** Settings ***
Resource    Renewals Suite Commons.robot
Resource    ../Resources/SFDC POM/Lightning POM/Accounts/Accounts.robot

Suite Setup       Renewals Suite Setup
Suite Teardown    Renewals Suite Teardown

*** Test Cases ***
SP3-ACC_1_Q2C2-132- Verify Account is accepting multiple locations in SFDC
    [Tags]    C1259501
    ${postfix}       Simple Create Default Account           Locations Test                with random postfix=True
    Open Related List                                        Locations
    Click New Button
    Select Account for Location                              Locations Test-${postfix}
    ${random prefix}                                         Generate Random String        3    chars=[NUMBERS]        
    ${first location name}                                   Set Variable                  ${random prefix}-Locations Test-${postfix}
    Input Location Name                                      ${first location name}
    ${random zip}                                            Generate Random String        5    chars=[NUMBERS]
    Input Value in New Location Dailog                       Street                        ${random zip} Polar Street
    Input Value in New Location Dailog                       City                          Modesto   
    Input Value in New Location Dailog                       State/Province	               CA
    Input Value in New Location Dailog                       Postal Code                   ${random zip}
    Input Value in New Location Dailog                       Country                       United States
    Click 'Next' in Location Dialog
    Wait for New Object of type                              Location
    Click Field Link                                         Account
    Wait for New Object of type                              Account
    sleep    1
    Open Related List                                        Locations
    Click New Button
    Select Account for Location                              Locations Test-${postfix}
    ${random prefix}                                         Generate Random String        3    chars=[NUMBERS]        
    ${second location name}                                  Set Variable                  ${random prefix}-Locations Test-${postfix}
    Input Location Name                                      ${second location name}
    ${random zip}                                            Generate Random String        5    chars=[NUMBERS]
    Input Value in New Location Dailog                       Street                        ${random zip} Polar Street
    Input Value in New Location Dailog                       City                          Modesto   
    Input Value in New Location Dailog                       State/Province	               CA
    Input Value in New Location Dailog                       Postal Code                   ${random zip}
    Input Value in New Location Dailog                       Country                       United States
    Click 'Next' in Location Dialog
    Wait for New Object of type                              Location
    Click Field Link                                         Account
    Wait for New Object of type                              Account
    Open Related List                                        Locations 
    Page Should Contain                                      ${first location name}
    Page Should Contain                                      ${second location name}      

SP3-ACC_1_Q2C2-132- Verify that Account is accepting multiple locations with same address in SFDC
    [Tags]    C1259502
    ${postfix}       Simple Create Default Account           Locations Test                with random postfix=True
    Open Related List                                        Locations
    Click New Button
    Select Account for Location                              Locations Test-${postfix}
    ${random prefix}                                         Generate Random String        3    chars=[NUMBERS]        
    ${same location name}                                    Set Variable                  ${random prefix}-Locations Test-${postfix}
    Input Location Name                                      ${same location name}
    ${random zip}                                            Generate Random String        5    chars=[NUMBERS]
    Input Value in New Location Dailog                       Street                        ${random zip} Polar Street
    Input Value in New Location Dailog                       City                          Modesto   
    Input Value in New Location Dailog                       State/Province	               CA
    Input Value in New Location Dailog                       Postal Code                   ${random zip}
    Input Value in New Location Dailog                       Country                       United States
    Click 'Next' in Location Dialog
    Wait for New Object of type                              Location
    Click Field Link                                         Account
    Wait for New Object of type                              Account
    sleep    1
    Open Related List                                        Locations
    Click New Button
    Select Account for Location                              Locations Test-${postfix}
    Input Location Name                                      clone-${same location name}
    Input Value in New Location Dailog                       Street                        ${random zip} Polar Street
    Input Value in New Location Dailog                       City                          Modesto   
    Input Value in New Location Dailog                       State/Province	               CA
    Input Value in New Location Dailog                       Postal Code                   ${random zip}
    Input Value in New Location Dailog                       Country                       United States
    Click 'Next' in Location Dialog
    Location Exists Dialog Shown with Location               ${same location name}
    Click 'Finish' in Location Dialog
    Wait for New Object of type                              Account
    Open Related List                                        Locations
    Page Should Contain                                      ${same location name}
    Locations list Count Should be                           1 item 

SP3-ACC_3_Q2C2-267- Verify that Street, city, country fields are required for Location creation
    [Tags]    C1259503
    Open Account by ID                         ${DEFAULT ACCOUNTS[0]}[ID]
    Open Related List                          Locations
    Click New Button
    #
    Select Account for Location                ${DEFAULT ACCOUNTS[0]}[Name]
    Input Location Name                        Street City Country validation
    Click Next And Wait for Message            Street, City and Country are required fields.
    Close Messgage and Click 'Next'
    #
    Select Account for Location                ${DEFAULT ACCOUNTS[0]}[Name]
    Input Location Name                        Street City Country validation
    Input Value in New Location Dailog         Street    Fascination street
    Click Next And Wait for Message            Street, City and Country are required fields.
    Close Messgage and Click 'Next'
    #
    Select Account for Location                ${DEFAULT ACCOUNTS[0]}[Name]
    Input Location Name                        Street City Country validation
    Input Value in New Location Dailog         Street    Fascination street
    Input Value in New Location Dailog         City    Modesto
    Click Next And Wait for Message            Street, City and Country are required fields.
    Close Messgage and Click 'Next'
    #
    Open Account by ID                         ${DEFAULT ACCOUNTS[0]}[ID]
    Wait for New Object of type                Account
    Open Related List                          Locations
    Page Should Not Contain                    Street City Country validation  

SP3-ACC_3_Q2C2-267-Verify that the user is able to see the Main Address field in Account Layout
    [Tags]    C1259643
    [Template]    Verify that the user is able to see the Main Address field in Account Layout
    FOR    ${account}	IN    @{DEFAULT ACCOUNTS}
            
            ${account}[ID]
            
    END 
          

*** Keywords ***

Verify that the user is able to see the Main Address field in Account Layout
    [Arguments]    ${account id}
    Open Account by ID                         ${account id}
    Page Should Contain Field                  Main Address  
    Click Action Button    Edit
    Page Should Contain Field                  Main Address    

Select Account for Location
    [Arguments]    ${value}    
    ${lookup item}        Set Variable       //input[@placeholder="Search Accounts..."]    #Loc for Look Up Item    ${lookup name}
    Wait Until Page Contains Element         //input[@placeholder="Search Accounts..."]    
    Click Element                            ${lookup item}
    Input Text    ${lookup item}    ${value} 
    sleep    1  
    Wait Until Element Is Visible            //lightning-base-combobox-formatted-text[@title="${value}"]//ancestor-or-self::lightning-base-combobox-item    #//span[.="${value}"]//ancestor-or-self::li            #//ul[@aria-label="Recent Accounts"]
    Click Element                            //lightning-base-combobox-formatted-text[@title="${value}"]//ancestor-or-self::lightning-base-combobox-item    #//span[.="${value}"]//ancestor-or-self::li    
    Wait Until Page Contains Element         //input[@placeholder="${value}"]    
    
Input Location Name
    [Arguments]    ${name}
    Input Text    //input[@name="Location_Name"]    ${name}

Input Value in New Location Dailog 
    [Arguments]    ${field name}    ${value}
    Input Text     //*[@placeholder="${field name}"]    ${value}

Click '${action}' in Location Dialog
    ${loc}    Set Variable    //button[@title="${action}" or .//text()="${action}"]
    Wait Until Keyword Succeeds    10x    1s    Click and Wait Untill Disapear    ${loc}    

Click and Wait Untill Disapear
    [Arguments]    ${loc}
    sleep    1
    ${count}    Get Element Count    ${loc}
    Return From Keyword If    ${count}==0
    Click Element                               ${loc}
    Wait Until Page Does Not Contain Element    ${loc}

Close Messgage and Click '${action}'
    ${loc}    Set Variable    //button[@title="${action}" or .//text()="${action}"]
    Click Element    //button[@title="${action}" or .//text()="${action}"]

Location Exists Dialog Shown with Location
    [Arguments]    ${existing location name}
    sleep    2
    Wait Until Page Contains Element   //div[@data-aura-class="uiOutputRichText"]    
    Element Text Should Be    //div[@data-aura-class="uiOutputRichText"]    One or more locations already exist with a similar address. Please use one of the Location records below (maximum of 20 displayed):

Locations list Count Should be
    [Arguments]    ${expected items count}
    ${counter}    Set Variable     //div[contains(@class, "windowViewMode-normal")]//span[@class="countSortedByFilteredBy"]
    Page Should Contain Element    ${counter}
    sleep    2    
    ${actual count}    Get Text    ${counter}
    Should Contain    ${actual count}    ${expected items count}    
                
