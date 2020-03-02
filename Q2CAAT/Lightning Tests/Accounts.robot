*** Settings ***
Resource        ../Resources/Commons/Global Setup.robot
Resource        ../Resources/SFDC POM/Login/Login.robot
Resource        ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        Lightning Suite Commons.robot
Resource        ../Resources/SFDC POM/Lightning POM/Accounts/Accounts.robot

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5011 - Create EDQ Case for Default Account
    [Tags]    C1146170
    Open SFDC object by ID                                 0011400001hn4DzAAI
    Expand Action Menu and Click Item                      Create EDQ Case  
    Wait New Record Modal Dialog for                       Create EDQ Case    
    New Record Dialog Should Contain Text Field            Subject                   required        #with_text=EDQ Request 
    New Record Dialog Should Contain Textarea Field        Description               required  
    Input text to Textarea Field                           Description               sample text
    Click Next
    Wait for New Object of type                            Case
    Field Should Have Value                                Status                    New
    Field Should Have Value                                Case Record Type          EDQ Record Type 
    Field Should Have Value                                Account Name              GB NAM DIRECT INSEQUENCE CORP
    Field Should Have Value                                Case Owner                EDQ Case Queue
    Field Should Have Value                                Case Origin               SFDC
    Field Should Have Value                                Subject                   EDQ Request
    Field Should Have Value                                Description               sample text

ITQTC-5011 - Create EDQ Case for Partner Account
    [Tags]    C1146171
    Open SFDC object by ID                                 0011b00000dP9pnAAC
    Expand Action Menu and Click Item                      Create EDQ Case  
    Wait New Record Modal Dialog for                       Create EDQ Case    
    New Record Dialog Should Contain Text Field            Subject                   required        #with_text=EDQ Request 
    New Record Dialog Should Contain Textarea Field        Description               required  
    Input text to Textarea Field                           Description               sample text
    Click Next
    Wait for New Object of type                            Case
    Field Should Have Value                                Status                    New
    Field Should Have Value                                Case Record Type          EDQ Record Type 
    Field Should Have Value                                Account Name              GB Partner Test Account
    Field Should Have Value                                Case Owner                EDQ Case Queue
    Field Should Have Value                                Case Origin               SFDC
    Field Should Have Value                                Subject                   EDQ Request
    Field Should Have Value                                Description               sample text
    
ITQTC-2480 - Change Account Hierarchy for Partner Account Record Type
    [Tags]    C1146133
    Open SFDC object by ID                                 0011b00000dP9pnAAC
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    Input text to Textarea Field                           Case Description               Please Change Account Hierarchy for Partner Account 
    Click Next
    Wait for New Object of type                            Case            
    Field Should Have Value                                Status                         New
    Field Should Have Value                                Case Owner                     Hierarchy Admin - Channel
    Field Should Have Value                                Case Record Type               Account Hierarchy

ITQTC-2480 - Change Account Hierarchy for Default Account Record Type
    [Tags]    C1146132
    Open SFDC object by ID                                 0011400001hn4DzAAI
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    Input text to Textarea Field                           Case Description               Please Change Account Hierarchy for Default Account
    Click Next
    Wait for New Object of type                            Case            
    Field Should Have Value                                Status                         New
    Field Should Have Value                                Case Owner                     Hierarchy Admin
    Field Should Have Value                                Case Record Type               Account Hierarchy
    
ITQTC-2480 - Description is required when Changing Account Hierarchy
    [Tags]    C1146145
    Open SFDC object by ID                                 0011400001hn4DzAAI
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    Click Next And Wait for Error                          Please enter some valid input. Input is not optional.  
    
ITQTC-5005 - Accounts - Translate 
    [Tags]    C1146111
    Simple Create Default Account                          ゴクナート                                        with random postfix=True
    Expand Action Menu and Click Item                      Translate
    Wait Until Field Contians Value                        Account Name            Goknat
