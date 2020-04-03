*** Settings ***
Resource        ../Resources/Commons/Global Setup.robot
Resource        ../Resources/SFDC POM/Login/Login.robot
Resource        ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Resources/SFDC POM/Lightning POM/Responses/Responses.robot
Resource        Lightning Suite Commons.robot

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Keywords ***
Unsuccessful attempt to assign Sales Rep to response
    [Arguments]    ${product group}=${EMPTY}    ${product interest}=${EMPTY}
    Skip test case for the following profiles          Quest Sales Rep        Quest Sales Manager    Quest Sales Ops
    ${response id}    SFDX Create Response     MQL     contact=Test Contact Has Response EOG RESOURCES INC    product group=${product group}    product interest=${product interest}
    Open Response By ID    ${response id}
    Wait for New Object of type           Response
    Expand Action Menu and Click Item     Assign Sales Rep
    ${expected message}    Set Variable   In order to assign a Response to a Partner, you must supply both the Product Group and Product Interest. Please return to the response and supply data in those fields.   
    Wait for Modal Dialog    Assign Sales Rep    ${expected message}

Create and Open Response
    [Arguments]    ${type}
    ${response id}    SFDX Create Response    	${type}
    Open Response By ID    ${response id} 

Create and Open Response with Contact
    [Arguments]    ${type}
    ${response id}    SFDX Create Response    ${type}    contact=Test Contact Has Response EOG RESOURCES INC
    Open Response By ID    ${response id}

Create and Open Response with Contact and Product Group and Interest 
    [Arguments]    ${type}    ${group}    ${interest}
    ${response id}    SFDX Create Response    ${type}    contact=Test Contact Has Response EOG RESOURCES INC    product group=${group}    product interest=${interest}
    Open Response By ID    ${response id}   

*** Test Cases ***

ITQTC-5026 - Assign Response with no Contact to a Partner
    [Tags]    C1145666
    Create and Open Response    	MQL
    Expand Action Menu and Click Item     Assign to Partner
    ${expected message}    Set Variable  You cannot assign this Response to a Partner since this does not have a contact. To solve this, please Convert to Contact first and then Assign to Partner.   
    Wait for Modal Dialog    Assign to Partner    ${expected message}
    No Assign Response to Partner Page Shown
 
ITQTC-5026 - Assign Response to a Partner
    [Tags]    C1145667
    Create and Open Response with Contact     MQL
    Expand Action Menu and Click Item     Assign to Partner
    Complete Assign Response to Partner
    
ITQTC-5025 - Assign Sales Rep for response without Product Group
    [Tags]    C1145614
    [Template]    Unsuccessful attempt to assign Sales Rep to response
    product group=${EMPTY}    product interest=AppAssure
    
ITQTC-5025 - Assign Sales Rep for response without Product Interest
    [Tags]    C1258332
    [Template]    Unsuccessful attempt to assign Sales Rep to response
    product group=Data Protection    product interest=${EMPTY}
    
ITQTC-5025 - Assign Sales Rep for response without Product Group and Product Interest
    [Tags]    C1258333
    [Template]    Unsuccessful attempt to assign Sales Rep to response
    product group=${EMPTY}    product interest=${EMPTY}
    
ITQTC-5025 - Assign Sales Rep for response with Product Group and Product Interest 
    [Tags]    C1145615
    Skip test case for the following profiles              Quest Sales Rep        Quest Sales Manager    Quest Sales Ops
    Create and Open Response with Contact and Product Group and Interest    MQL    group=Data Protection    interest=AppAssure    
    Expand Action Menu and Click Item     Assign Sales Rep
    ${expected message}    Set Variable   Your Response has been assigned..   
    Wait for Modal Dialog    Assign Sales Rep    ${expected message}
    #Item Is Checked          Run Assignment    TRUE    #ITQTC-5025 contains comment: Linnae wrote "The button sets the Run Assignment flag to true, but as part of the existing assignment code it resets the flag back to false