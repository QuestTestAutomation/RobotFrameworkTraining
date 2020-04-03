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
    Open Default Account from Test Data
    Expand Action Menu and Click Item                      Create EDQ Case  
    Wait New Record Modal Dialog for                       Create EDQ Case    
    New Record Dialog Should Contain Text Field            Subject                   required        #with_text=EDQ Request 
    New Record Dialog Should Contain Textarea Field        Description               required  
    New Record Dialog Insert To Textarea                   Description               sample text
    Click Next    
    Wait for New Object of type                            Case
    Field Should Have Value                                Status                    New
    Field Should Have Value                                Case Record Type          EDQ Record Type
    Field Should Have Value                                Account Name              ${LIGHTNING_DEFAULT_ACCOUNT['Name']}
    Field Should Have Value                                Case Owner                EDQ Case Queue
    Field Should Have Value                                Case Origin               SFDC
    Field Should Have Value                                Subject                   EDQ Request
    Field Should Have Value                                Description               sample text

ITQTC-5011 - Create EDQ Case for Partner Account
    [Tags]    C1146171
    Open Partner Account from Test Data
    Expand Action Menu and Click Item                      Create EDQ Case  
    Wait New Record Modal Dialog for                       Create EDQ Case    
    New Record Dialog Should Contain Text Field            Subject                   required        #with_text=EDQ Request 
    New Record Dialog Should Contain Textarea Field        Description               required  
    New Record Dialog Insert To Textarea                   Description               sample text
    Click Next
    Wait for New Object of type                            Case
    Field Should Have Value                                Status                    New
    Field Should Have Value                                Case Record Type          EDQ Record Type 
    Field Should Have Value                                Account Name              ${LIGHTNING_PARTNER_ACCOUNT['Name']}
    Field Should Have Value                                Case Owner                EDQ Case Queue
    Field Should Have Value                                Case Origin               SFDC
    Field Should Have Value                                Subject                   EDQ Request
    Field Should Have Value                                Description               sample text
    
ITQTC-2480 - Change Account Hierarchy for Partner Account Record Type
    [Tags]    C1146133
    Open Partner Account from Test Data
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    New Record Dialog Insert To Textarea                   Case Description               Please Change Account Hierarchy for Partner Account 
    Click Next
    Wait for New Object of type                            Case            
    Field Should Have Value                                Status                         New
    Field Should Have Value                                Case Owner                     Hierarchy Admin - Channel
    Field Should Have Value                                Case Record Type               Account Hierarchy

ITQTC-2480 - Change Account Hierarchy for Default Account Record Type
    [Tags]    C1146132
    Open Default Account from Test Data
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    New Record Dialog Insert To Textarea                   Case Description               Please Change Account Hierarchy for Default Account
    Click Next
    Wait for New Object of type                            Case            
    Field Should Have Value                                Status                         New
    Field Should Have Value                                Case Owner                     Hierarchy Admin
    Field Should Have Value                                Case Record Type               Account Hierarchy
    
ITQTC-2480 - Description is required when Changing Account Hierarchy
    [Tags]    C1146145
    Open Default Account from Test Data
    Expand Action Menu and Click Item                      Change Account Hierarchy
    Wait New Record Modal Dialog for                       Change Account Hierarchy
    Click Next And Wait for Error                          Please enter some valid input. Input is not optional.  
    
ITQTC-5005 - Accounts - Translate 
    [Tags]    C1146111
    Skip test case for the following profiles              Quest Sales Rep        Quest Sales Manager    
    ${postfix}    Simple Create Default Account            ゴクナート                                       with random postfix=True
    Expand Action Menu and Click Item                      Translate
    Wait Until Field Contians Values                       Account Name           Gokunath-${postfix}    Goknat-${postfix}

Q2C2-32- Verify that Location record can be created from the Account object
    [Tags]    C1259645
    Open Default Account from Test Data
    ${name}    Get Value from                              Account Name
    Page Should Contain Related List                       Locations
    Expand Action Menu and Click Item                      New Location
    Wait New Record Modal Dialog for                       New Location
    ${time}                                                Get Time        epoch
    Insert value in Text Box                               Location Name    ${name} ${time} 
    Insert Text To Textarea Field                          Street   ${time} 
    Click Next
    Wait for New Object of type                            Location
    Field Should Have Value	                               Account          ${name}
    Field Should Have Value	                               Location Name    ${name} ${time}
    Field Should Have Value	                               Street           ${time}

Q2C2-32- Verify that Validation rules are implemented for mandatory fields
    [Tags]    C1259649
    Open Default Account from Test Data
    ${name}    Get Value from                              Account Name
    Page Should Contain Related List                       Locations
    Expand Action Menu of Related List and Click Item      Locations        New
    Wait New Record Modal Dialog for                       Account - New Location
    ${time}                                                Get Time         epoch
    Insert value in Text Box                               Account          ${EMPTY}
    Insert value in Text Box                               Location Name    ${EMPTY}
    Click Next And Wait for Error                          Please enter some valid input.
    Select value in Combo Box                              Account          ${name}    ${LIGHTNING_DEFAULT_ACCOUNT['ID']} 
    Insert value in Text Box                               Location Name    ${name} ${time} 
    sleep    1
    Click Next And Wait for Error                          Street, City and Country are required fields.
    Click Next
    Select value in Combo Box                              Account          ${name}    ${LIGHTNING_DEFAULT_ACCOUNT['ID']} 
    Insert value in Text Box                               Location Name    ${name} ${time} 
    Insert Text To Textarea Field                          Street	        ${time} 
    Insert value in Text Box                               City	            Aliso Viejo
    Insert value in Text Box                               Country          United States
    Insert value in Text Box                               State/Province   California
    Insert value in Text Box                               Postal Code      92656
    Click Next And Wait for Message                        The Primary Bill-To Location and/or Primary Ship-To Location on the account will now point to this new Location record
    Click Next
    Wait for New Object of type                            Location
    Field Should Have Value	                               Account          ${name}
    Field Should Have Value	                               Location Name    ${name} ${time}
    Field Should Have Value	                               Street           ${time}
    Field Should Have Value	                               City	            Aliso Viejo
    Field Should Have Value                                Country          United States
    Field Should Have Value                                State/Province   California
    Field Should Have Value                                Postal Code      92656
    Capture Page Screenshot
    
Q2C2-32- Verify that Primary Bill To Location field is available on Account page layout
    [Tags]    C1259646
    Open Default Account from Test Data
    Wait for New Object of type              Account
    Page Should Contain Field                Primary Bill To Location

Q2C2-32- Verify that Primary Ship To Location field is available on Account page layout
    [Tags]    C1259647
    Open Default Account from Test Data
    Wait for New Object of type              Account
    Page Should Contain Field                Primary Ship To Location

Q2C2-32- Verify that 2 financial fields are available on Account page layout
    [Tags]    C1259648
    Open Default Account from Test Data
    Wait for New Object of type              Account
    Page Should Contain Field                Credit Profile
    Page Should Contain Field                PO Required
