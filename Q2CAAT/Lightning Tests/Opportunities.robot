*** Settings ***
Resource        ../Resources/Commons/Global Setup.robot
Resource        ../Resources/SFDC POM/Login/Login.robot
Resource        ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        ../Resources/SFDC POM/Lightning POM/Opportunities/Opportunities.robot
Resource        Lightning Suite Commons.robot
Resource        ../Resources/SFDC POM/Lightning POM/Contacts/Contacts.robot
Resource        ../Resources/SFDC POM/Lightning POM/Responses/Responses.robot
Force Tags      debug

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5019 - Create SC Case
    [Tags]    C1146101    debug
    Open SFDC object by ID                      0067A0000063lT2QAI
    Expand Action Menu and Click Item                Request SC
    Wait for New Browser Window with URL        https://prmapp.quest.com/prm/php/request.php
    
ITQTC-5053 - Create Subscription Oppty for Contact which has no open responses
    [Tags]    C1146294
    Create and Open a Contact with no Responses
    Expand Action Menu and Click Item              New Subscription Oppty
    Wait for New Object of type                    Opportunity
    Switch to Record Info Tab                      Details    
    Field Should Have Value                        Opportunity Record Type	        Subscription
    Field Should Have Value                        Stage                            01 - Prospect
    Field Should Have Value                        Forecast Category – Reporting    Pipeline
    Field Should Have Value                        Probability (%)                  10%
    
ITQTC-5053 - Create Subscription Oppty for Contact has an open response where you are response owner (Create Opportunity from selected Response)
    [Tags]    C1146295
    Create and Open a Contact with Response owned by Test User
    Expand Action Menu and Click Item                      New Subscription Oppty
    Wait New Record Modal Dialog for                       New Subscription Oppty
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        Create Opportunity from selected Response
    Click Next And Wait for Error                          You selected to create the Opportunity from one of the listed Responses, but didn't select a Response.
    Click Previous
    Wait New Record Modal Dialog for                       New Subscription Oppty
    ${value RP}    Select Response with Status             MQL    #Oppty Created
    Click Next
    Wait for New Object of type                            Opportunity
    Switch to Record Info Tab                              Details 
    Field Should Have Value	                               Opportunity Record Type   Long Sales Process    #//Should be Subscription. But: Known issue Opportunity Record Type is Long Sales Process
    Field Should Have Value                                Opportunity Source        Marketing
    Field Should Have Value                                Response - Oppty          ${value RP}
    Click Field Link                                       Response - Oppty
    Wait for New Object of type                            Response
    Field Should Have Value                                Status                    Oppty Created
    
ITQTC-5053 - Create Subscription Oppty for Contact has an open response where you are response owner (No Marketing Involvement - No Lead Source)
    [Tags]    C1146304
    #Open SFDC object by ID                                 0031O00003HkjUZQAZ
    Create and Open a Contact with Response owned by Test User
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Expand Action Menu and Click Item                      New Subscription Oppty
    Wait New Record Modal Dialog for                       New Subscription Oppty
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        No Marketing Involvement
    Click Next
    Wait for New Object of type                            Opportunity
    Switch to Record Info Tab                              Details 
    Field Should Have Value	                               Opportunity Record Type   Subscription
    Field Should Have Value                                Opportunity Source        Sales
    Field Should Have Value                                Response - Oppty          ${EMPTY}
    Field Should Have Value                                Lead Source               ${EMPTY}
    Item Is Checked                                        Non Marketing Influence   TRUE

ITQTC-5053 - Create Subscription Oppty for Contact has an open response where you are response owner (No Marketing Involvement - Lead Source is not blank)
    [Tags]    C1146305
    #Open SFDC object by ID                                 0033000001HZabPAAT
    Create and Open a Contact with Response owned by Test User
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Expand Action Menu and Click Item                      New Subscription Oppty
    Wait New Record Modal Dialog for                       New Subscription Oppty
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        No Marketing Involvement
    Click Next
    Wait for New Object of type                            Opportunity
    Switch to Record Info Tab                              Details 
    Field Should Have Value	                               Opportunity Record Type   Subscription
    Field Should Have Value                                Opportunity Source        Sales
    Field Should Have Value                                Response - Oppty          ${EMPTY}
    Field Should Have Value                                Lead Source               Download - Trial
    Item Is Checked                                        Non Marketing Influence   TRUE
   
ITQTC-2473- Verify button "New Opportunity" is displayed on Contact Object without Open Responses
    [Tags]    C1145623
    #Open SFDC object by ID                 0037A00000OZKS5QAP    #//0031O00003HkjUZQAZ
    Create and Open a Contact with no Responses
    Wait for New Object of type            Contact
    Close Alert Message                    View Duplicates
    Expand Action Menu and Click Item      New Opportunity
    Wait for New Object of type            Opportunity
    Switch to Record Info Tab              Details
    Field Should Have Value                Opportunity Record Type	        Long Sales Process
    Field Should Have Value                Stage                            01 - Prospect
    Field Should Have Value                Forecast Category – Reporting    Pipeline
    Field Should Have Value                Probability (%)                  10% 
    Opportunity Contains Contact Role      ${new contact id}
    
ITQTC-2473- Verify button "New Opportunity" is displayed on Contact Object with Open Responses (No Marketing Involvement)
    [Tags]    C1146293
    #Open SFDC object by ID                                 0031O00003HkjUZQAZ
    Create and Open a Contact with Response owned by Test User
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Expand Action Menu and Click Item                      New Opportunity
    Wait New Record Modal Dialog for                       New Opportunity
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        No Marketing Involvement
    Click Next
    Wait for New Object of type                            Opportunity
    Switch to Record Info Tab                              Details
    Field Should Have Value	                               Opportunity Record Type          Long Sales Process
    Field Should Have Value                                Stage                            01 - Prospect
    Field Should Have Value                                Forecast Category – Reporting    Pipeline
    Field Should Have Value                                Probability (%)                  10% 
    Field Should Have Value                                Response - Oppty                 ${EMPTY}
    Field Should Have Value                                Lead Source                      ${EMPTY}
    #Item Is Checked                                        Non Marketing Influence          TRUE
    Opportunity Contains Contact Role                      ${new contact id}
    
ITQTC-2473- Verify button "New Opportunity" is displayed on Contact Object with Open Responses (Create opportunity from selected response)
    [Tags]    C1259644
    Create and Open a Contact with Response owned by Test User
    #Open SFDC object by ID                                 0031O00003HkjUZQAZ
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Expand Action Menu and Click Item                      New Opportunity
    Wait New Record Modal Dialog for                       New Opportunity
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        Create Opportunity from selected Response
    Click Next And Wait for Error                          You selected to create the Opportunity from one of the listed Responses, but didn't select a Response.
    Click Previous
    Wait New Record Modal Dialog for                       New Opportunity
    ${value RP}    Select Response with Status             MQL    #Oppty Created
    Click Next
    Wait for New Object of type                            Opportunity
    Switch to Record Info Tab                              Details
    Field Should Have Value	                               Opportunity Record Type   Long Sales Process    #//Should be Subscription. But: Known issue Opportunity Record Type is Long Sales Process
    Field Should Have Value                                Opportunity Source        Marketing
    Field Should Have Value                                Stage                     01 - Prospect
    Field Should Have Value                                Forecast Category – Reporting    Pipeline
    Field Should Have Value                                Probability (%)           10% 
    Field Should Have Value                                Response - Oppty          ${value RP}
    Click Field Link                                       Response - Oppty
    Wait for New Object of type                            Response
    Field Should Have Value                                Status                    Oppty Created
    Go Back
    Wait for New Object of type                            Opportunity
    Opportunity Contains Contact Role                      ${new contact id}    
    
*** Keywords ***
Create and Open a Contact with no Responses
    ${test account}                    Fetch Random Test Object From Worksheet    Default Accounts
    ${new contact id}                  SFDX Crerate Contact    ${test account['ID']}    With No Responses    For ${test account['Name']}
    Set Test Variable    ${new contact id}
    Open Contact by ID                 ${new contact id}
    Wait for New Object of type        Contact
    Close Alert Message                View Duplicates
        
 
Create and Open a Contact with Response owned by Test User
    #Open Contact by ID    0033J000003w5PYQAY
    ${prefix}                                              Generate Random String    4    [NUMBERS]
    ${test account}                                        Fetch Random Test Object From Worksheet    Default Accounts
    ${new contact id}                                      SFDX Crerate Contact    ${test account['ID']}    ${prefix} Has Responses    For ${test account['Name']}
    ${new response id}                                     SFDX Create Response    MQL    contact=${prefix} Has Responses For ${test account['Name']}
    Set Test Variable                                      ${new contact id}
    Set Test Variable                                      ${new response id}
    Run Keyword If  '${PROFILE}' is not 'System Administrator'      Change Response Owner   ${new response id}      ${SF_USER}[display_name]
    Open Contact by ID                                     ${new contact id}
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    