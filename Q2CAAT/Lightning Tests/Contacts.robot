*** Settings ***
Resource        ../Resources/Commons/Global Setup.robot
Resource        ../Resources/SFDC POM/Login/Login.robot
Resource        ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Resources/SFDC POM/Lightning POM/Contacts/Contacts.robot
Resource        ../Resources/SFDC POM/Lightning POM/Accounts/Accounts.robot
Resource        Lightning Suite Commons.robot

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5033-Verify New Contact button (Account (Sales Rep) Layout)
    [Tags]    C1146493
    Skip test case for the following profiles              Quest Sales Ops    System Administrator
    Open Default Account from Test Data
    #Open SFDC object by ID                                 0013J0000046g6cQAA
    Close Alert Message                                    View Duplicates
    Expand Action Menu and Click Item                      New Contact
    Wait New Record Modal Dialog for                       New Contact
    ${time}                                                Get Time    epoch
    Insert value in Text Box                               Last Name               Test
    Insert value in Text Box                               First Name              ${time}
    Click Save Button
    Close Alert Message                                    ${time} Test
    Related List Contains Contact                          ${time} Test

ITQTC-5033-Verify New Contact button (Account (Admin) Layout)
    [Tags]    C1260229
    Skip test case for the following profiles              Quest Sales Rep        Quest Sales Manager
    ${modal window}    Set Variable If    '${PROFILE}'=='System Administrator'    New Contact    New Contact: Default Contact Record
    #Open SFDC object by ID                                 0013J0000046g6cQAA    #0013J0000046g6cQAA
    Open Default Account from Test Data
    Close Alert Message                                    View Duplicates
    Layout Should not Contain Action Menu Item             New Contact    
    Expand Action Menu of Related List and Click Item      Related Contacts    New Contact
    Wait New Record Modal Dialog for                       ${modal window}
    Run Keyword If    '${PROFILE}'=='System Administrator'    Click Next
    Run Keyword If    '${PROFILE}'=='System Administrator'    Wait New Record Modal Dialog for                       New Contact: Default Contact Record
    ${time}                                                Get Time    epoch
    Insert value in Text Box                               Last Name               Test
    Insert value in Text Box                               First Name              ${time}
    Click Save Button
    Close Alert Message                                    ${time} Test
    Related List Contains Contact                          ${time} Test
    