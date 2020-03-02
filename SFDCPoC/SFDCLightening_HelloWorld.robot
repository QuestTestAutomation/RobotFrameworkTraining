*** Settings ***
Resource        ../Q2CAAT/Resources/Commons/Global Setup.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Login/Login.robot
Resource        ../Q2CAAT/Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Q2CAAT/Lightning Tests/Lightning Suite Commons.robot
Resource        ../Q2CAAT/Resources/SFDC POM/Lightning POM/Accounts/Accounts.robot

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5099 - Create EDQ Case for Default Account
    [Tags]    C1146
    Open SFDC object by ID                                 0011400001hn4DzAAI