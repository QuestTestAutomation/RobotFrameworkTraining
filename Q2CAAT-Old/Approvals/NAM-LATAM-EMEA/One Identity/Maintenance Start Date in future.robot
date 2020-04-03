*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create OID Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${inf mgmt license product}            AAB-EVI-PS


@{future maint amer mgr approvers oi}       David Stepancic

&{future maint amer mgr rule oi}            chain=Future Maintenance    
                                            ...    rule=Global Sales Manager Approval - OI    
                                            ...    approvers=@{future maint amer mgr approvers oi}
                                            ...    children=true
 

*** Test Cases ***
Identity and Security Mgmt. NAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313640
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                | MGR approval                    |  DD approval                   |  Legal approval    
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule oi}     ${future maint amer dd rule}     ${legal us-can rule}
    
    
Identity and Security Mgmt. EMEA Direct Quote Maintenance Start Date in future-APPROVER IS Troy Steen 
    [Tags]    C313641
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                 | MGR approval                    |  DD approval                  |  Legal approval  
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}    ${inf mgmt license product}    ${maintenance start date}   ${future maint amer mgr rule oi}     ${future maint emea dd rule}     ${legal emea rule}
    
Identity and Security Mgmt. LATAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313642
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                      | Future date                 | MGR approval                    |  DD approval                  |  Legal approval  
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}    ${inf mgmt license product}    ${maintenance start date}   ${future maint amer mgr rule oi}     ${future maint amer dd rule}     ${legal latam rule}
    
Identity and Security Mgmt. NAM Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313656
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                     | Future date                | MGR approval                    |  DD approval                   |  Legal approval    
 #------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM channel account oppty}    ${inf mgmt license product}    ${maintenance start date}    ${future maint amer mgr rule oi}     ${future maint amer dd rule}     ${legal us-can rule}

Identity and Security Mgmt. LATAM Channel Quote Maintenance Start Date in future-APPROVER IS Troy Steen and George Karabatsos
    [Tags]    C313658
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                      | Future date                 | MGR approval                    |  DD approval                  |  Legal approval  
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM channel account oppty}    ${inf mgmt license product}    ${maintenance start date}   ${future maint amer mgr rule oi}     ${future maint amer dd rule}     ${legal latam rule}
        