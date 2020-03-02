*** Settings ***
Resource        ../Resources/Commons/Global Setup.robot
Resource        ../Resources/SFDC POM/Login/Login.robot
Resource        ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource        ../Resources/SFDC POM/Lightning POM/App Launcher.robot
Resource        ../Resources/SFDC POM/Lightning POM/Navigation Bar.robot
Resource        ../Resources/SFDC POM/Lightning POM/Common Elements.robot
Resource        ../Resources/SFDC POM/Lightning POM/New Record Dialog.robot
Resource        Lightning Suite Commons.robot

Suite Setup       Lightning Suite Setup
Suite Teardown    Lightning Suite Teardown

*** Test Cases ***
ITQTC-5019 - Create SC Case
    [Tags]    C1146101
    Open SFDC object by ID                      0067A0000063lT2QAI
    Expand Action Menu and Click Item                Request SC
    Wait for New Browser Window with URL        https://prmapp.quest.com/prm/php/request.php
    
ITQTC-5053 - Create Subscription Oppty for Contact which has no open responses
    [Tags]    C1146294
    Open SFDC object by ID             0037A00000OZKS5QAP    #//0031O00003HkjUZQAZ
    Wait for New Object of type        Contact
    Close Alert Message                View Duplicates
    Click Action Button                New Subscription Oppty
    Wait for New Object of type        Opportunity
    Field Should Have Value            Opportunity Record Type	        Subscription
    Field Should Have Value            Stage                            01 - Prospect
    Field Should Have Value            Forecast Category – Reporting    Pipeline
    Field Should Have Value            Probability (%)                  10%
    
ITQTC-5053 - Create Subscription Oppty for Contact has an open response where you are response owner (Create Opportunity from selected Response)
    [Tags]    C1146295
    Open SFDC object by ID                                 0031O00003HkjUZQAZ
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Click Action Button                                    New Subscription Oppty
    Wait New Record Modal Dialog for                       New Subscription Oppty
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        Create Opportunity from selected Response
    Click Next And Wait for Error                          You selected to create the Opportunity from one of the listed Responses, but didn't select a Response.
    Click Previous
    Wait New Record Modal Dialog for                       New Subscription Oppty
    ${value RP}    Select Response with Status             Oppty Created
    Click Next
    Wait for New Object of type                            Opportunity
    Field Should Have Value	                               Opportunity Record Type   Long Sales Process    #//Should be Subscription. But: Known issue Opportunity Record Type is Long Sales Process
    Field Should Have Value                                Opportunity Source        Marketing
    Field Should Have Value                                Response - Oppty          ${value RP}
    Click Field Link                                       Response - Oppty
    Wait for New Object of type                            Response
    Field Should Have Value                                Status                    Oppty Created
    
ITQTC-5053 - Create Subscription Oppty for Contact has an open response where you are response owner (No Marketing Involvement - No Lead Source)
    [Tags]    C1146304
    Open SFDC object by ID                                 0031O00003HkjUZQAZ
    Wait for New Object of type                            Contact
    Close Alert Message                                    View Duplicates
    Click Action Button                                    New Subscription Oppty
    Wait New Record Modal Dialog for                       New Subscription Oppty
    New Record Dialog Should Contain RadioButton Field     Opportunity Source        No Marketing Involvement
    New Record Dialog Should Contain RadioButton Field	   Opportunity Source        Create Opportunity from selected Response
    New Record Dialog Should Contain DropDown List Field   New Opportunity Currency
    Select RadioButton Field                               Opportunity Source        No Marketing Involvement
    Click Next
    Wait for New Object of type                            Opportunity
    Field Should Have Value	                               Opportunity Record Type   Subscription
    Field Should Have Value                                Opportunity Source        Sales
    Field Should Have Value                                Response - Oppty          ${EMPTY}
    Field Should Have Value                                Lead Source               ${EMPTY}
    #//Field Should Have Value                                No Marketing Influence
    