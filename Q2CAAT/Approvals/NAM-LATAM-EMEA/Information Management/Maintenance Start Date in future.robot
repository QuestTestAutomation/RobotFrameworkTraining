*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${inf mgmt license product}                 ABF-FOG-PS


@{future maint amer mgr approvers im}       David Stepancic

&{future maint amer mgr rule im}            chain=Future Maintenance    
                                            ...    rule=Global Sales Manager Approval - IM    
                                            ...    approvers=@{future maint amer mgr approvers im}
                                            ...    children=true
 

*** Test Cases ***
Information Mgmt. NAM Direct Quote Maintenance Start Date in future - APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313628
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                | MGR approval                     |  DD approval  
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule im}     ${future maint amer dd rule}
    
    
Information Mgmt. EMEA Direct Quote Maintenance Start Date in future - APPROVER IS Troy Steen 
    [Tags]    C313629
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                 | MGR approval                    |  DD approval   
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule im}    ${future maint emea dd rule}
    
Information Mgmt. LATAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313630
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                      | Future date                  | MGR approval                   |  DD approval   
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule im}     ${future maint amer dd rule}
    
Information Mgmt. NAM Channel Quote Maintenance Start Date in future - APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313644
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                | MGR approval                     |  DD approval  
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM channel account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule im}     ${future maint amer dd rule}
      
Information Mgmt. LATAM Channel Quote Maintenance Start Date in future-APPROVER IS Troy Steen and George Karabatsos
    [Tags]    C313646
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                      | Future date                  | MGR approval                   |  DD approval   
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM channel account oppty}  ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule im}     ${future maint amer dd rule}
    