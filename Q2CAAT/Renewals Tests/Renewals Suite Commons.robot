*** Settings ***
Resource    ../Resources/Commons/Global Setup.robot
Resource    ../Resources/SFDC POM/Login/Login.robot
Resource    ../Resources/Commons/Test Data Mgmt.robot
Resource    ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource    ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot

*** Variables ***
${PROFILE}	                      ${EMPTY}    #Quest Sales Manager    #Quest Sales Ops    #Quest Sales Rep    #${EMPTY} 
@{DEFAULT ACCOUNTS}               @{EMPTY}
@{PARTNER ACCOUNTS}               @{EMPTY}

*** Keywords ***
Renewals Suite Setup
    Suite Setup
    Override Renewal Suite Globals
    Load Renewals Test Data
    Set Suite Metadata        [Run As] Profile        ${PROFILE}
    Set Suite Metadata        [Run As] Username       ${SF_USER}[email]
    Set Suite Metadata        [Run As] Name           ${SF_USER}[display_name]        
    Login To SFDC sandbox     experience=Lightning
    #Run Keyword If    '${RUN_AS_USER}' is not 'Default'  Wait Until Keyword Succeeds	5x   2s   Lightning Login As    ${RUN_AS_USER}

    
Renewals Suite Teardown
    Close Browser
    Log    == TEST VARIABLES ==
    Log Variables

Skip test case for the following profiles
    [Arguments]    @{profiles}
    Log List       ${profiles}    
    Pass Execution If   '${PROFILE}' in @{profiles}   Test should not be exectued for the following profile: ${profile}

Override Renewal Suite Globals
    log    ${PROFILE}
    &{dict}    Load Variable-Value Pairs From Worksheet to Dictionary    Global Values
    Log Dictionary    ${dict}
    &{SF_USER}    Run Keyword If    '${PROFILE}' == 'Quest Sales Rep'         Evaluate    ${dict['Quest_Sales_Rep']}
    ...   ELSE IF                   '${PROFILE}' == 'Quest Sales Ops'         Evaluate    ${dict['Quest_Sales_Ops']}
    ...   ELSE IF                   '${PROFILE}' == 'Quest Sales Manager'     Evaluate    ${dict['Quest_Sales_Manager']}
    ...   ELSE                                                                Evaluate    ${dict['SF_USER']}
    
    ${BASE_URL}               Evaluate    ${dict['BASE_URL']}
    ${LIGHTNING_BASE_URL}     Evaluate    ${dict['LIGHTNING_BASE_URL']}
    Set Suite Variable        &{SF_USER}    
    Set Suite Variable        ${BASE_URL}    
    Set Suite Variable        ${LIGHTNING_BASE_URL}

Load Renewals Test Data
    @{records}    Load All Records From Worksheet to Dictionary    Default Accounts    data file=_Renewals_Data.xlsx
    Set Suite Variable   @{DEFAULT ACCOUNTS}   @{records}    
    @{records}    Load All Records From Worksheet to Dictionary    Partner Accounts    data file=_Renewals_Data.xlsx
    Set Suite Variable    @{PARTNER ACCOUNTS}    @{records}
        