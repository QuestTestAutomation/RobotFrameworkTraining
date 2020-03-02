*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    Login Page Locators.robot
Resource    ../../Commons/SFDC Common Variables.robot
Resource    ../SFDC Navigation/Search and Open SFDC Objects.robot

*** Keyword ***
Login as 
    [Arguments]    ${user name}
    ${url to return}                      Get Location
    ${user id}    Get User ID for         ${user name}
    ${user details url}   Set Variable    ${BASE_URL}/${user id}?noredirect=1&isUserEntityOverride=1
    go to                                 ${user details url}
    Wait Until Page Contains              ${user name}    
    Wait Until Page Contains Element      ${login from user details button}
    Click Element                         ${login from user details button}
    Wait Until Element Contains           ${logged as message}    Logged in as ${user name} 
    Go To                                 ${url to return} 

Log out from
    [Arguments]     ${user name}
    ${url to return}    Get Location
    Wait Until Element Contains                 ${user_nav_label}    ${user name}
    Click Element                               ${user_nav_label}    
    Wait Until Page Contains Element            ${logout menu item}    
    Click Element                               ${logout menu item}
    Wait Until Page Does Not Contain Element    ${logged as message}
    Go To                                       ${url to return}       
    

Login To SFDC sandbox
    [Documentation]    Login to SFDC
    Set Tags    ENV_${SANDBOX}
    Set Selenium Timeout    ${MAX_WAIT_TIME}
    #Set Selenium Speed    0.2 seconds 
    Log    &{SF_USER}[email]
	Open Test SFDC site using '${ENVIRONMENT}' environment
	Maximize Browser Window
	Set Window Size    1920    1200
	Wait Until Page Contains Element    ${login_button}
	Input Text    ${user_name_textbox}    &{SF_USER}[email]
	Input Password    ${password_textbox}    &{SF_USER}[password]
	Click Element    ${login_button}
	Verify Your Identity
	Wait Until Page Contains Element    ${user_nav_label}
	sleep    1
	Wait Until Element Contains    ${user_nav_label}    &{SF_USER}[display_name]
	[Teardown]    Visualize keyword result    Login to SFDC as &{SF_USER}[email]  
	
Verify Your Identity
    [Documentation]    Send vrification code if needed
    ${h2_count}=    Get Element Count    //h2
    Return From Keyword If    '${h2_count}' == '0'    No verification needed    
    ${verify}=    Get Text    //h2
    Return From Keyword If    '${verify}' != 'Verify Your Identity'    ${verify}
    Input Text    id:emc    ${VERIFICATION_CODE}
    Click Element    id:save


Open Test SFDC site using '${env}' environment
    [Documentation]    Start work with SFDC using locak webdriver or remote selenium grid
    Run Keyword If    '${env}'=='Local'    Open Test SFDC Site On Local Environment
    Run Keyword If    '${env}'=='Remote'    Open Test SFDC Site On Remote Environment    

Open Test SFDC Site On Local Environment
    [Documentation]    Open browser locally
    Open Browser    url=${BASE_URL}    browser=${BROWSER}
    
Open Test SFDC Site On Remote Environment
    [Documentation]    Open browser remotely. SauceLabs for now
    ${REMOTE_URL}    Set Variable    http://sso-quest-Gennady.Borodin:8d553dcb-3305-4247-b2c5-0acc04d8b376@ondemand.saucelabs.com:80/wd/hub
    &{DESIRED_CAPABILITIES}=    Create Dictionary
    Set To Dictionary    ${DESIRED_CAPABILITIES}    browserName=${BROWSER}
    Set To Dictionary    ${DESIRED_CAPABILITIES}    platform=Windows 10
    Set To Dictionary    ${DESIRED_CAPABILITIES}    name=${TEST_NAME}
    Set To Dictionary    ${DESIRED_CAPABILITIES}    build=Q2C Test Automation 
    Open Browser    ${BASE_URL}    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}
