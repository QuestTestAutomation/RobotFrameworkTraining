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
#Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5099 - Create EDQ Case for Default Account
    [Tags]    C1146
    Open SFDC object by ID                                 0011400001hn4DzAAI
    Expand Action Menu and Click Item  View Account Hierarchy
    #Open App  Products & Pricing
   # GoTo Object Tab  Accounts
   # GoTo Object Tab  Cases
   # GoTo Object Tab  Contacts
   # Click Action Button  slds-icon-waffle
    #Click Element  xpath=/html/body/div[4]/div[1]/section/header/div[3]/one-appnav/div/div/div/nav/one-app-launcher-header/button/div
    #Click Element  xpath=//*[@id="window"]/button/div
   # Click Element  //div[@class="bBottom"]//nav[@role="navigation"]//button[.="App Launcher"]
    # Open App  Sales Console