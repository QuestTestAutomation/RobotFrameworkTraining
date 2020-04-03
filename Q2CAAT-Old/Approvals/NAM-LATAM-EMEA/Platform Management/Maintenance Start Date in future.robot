*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${platform mgmt license product #1}        AME-MLX-PS
${platform mgmt license product #2}        AAA-SCL-PS
${platform mgmt license product #3}        ABL-NPO-PS


@{future maint amer mgr approvers pm}       David Stepancic

&{future maint amer mgr rule pm}            chain=Future Maintenance    
                                            ...    rule=Global Sales Manager Approval - PM    
                                            ...    approvers=@{future maint amer mgr approvers pm}
 

*** Test Cases ***
Platform Mgmt. NAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313632
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                             | Future date                 | MGR approval                    |  DD approval   
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}    ${platform mgmt license product #1}    ${maintenance start date}    ${future maint amer mgr rule pm}     ${future maint amer dd rule}
    
    
Platform Mgmt. EMEA Direct Quote Maintenance Start Date in future -APPROVER IS Troy Steen 
    [Tags]    C313633
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                             | Future date                 | MGR approval                     |  DD approval   
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}    ${platform mgmt license product #2}    ${maintenance start date}    ${future maint amer mgr rule pm}    ${future maint emea dd rule}
    
Platform Mgmt. LATAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313634
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                              | Future date                 | MGR approval                    |  DD approval   
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}    ${platform mgmt license product #3}    ${maintenance start date}   ${future maint amer mgr rule pm}     ${future maint amer dd rule}
    
Platform Mgmt. NAM Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk 
    [Tags]    C313648
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                             | Future date                 | MGR approval                    |  DD approval   
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM channel account oppty}    ${platform mgmt license product #1}    ${maintenance start date}    ${future maint amer mgr rule pm}     ${future maint amer dd rule}

Platform Mgmt. LATAM Channel Quote Maintenance Start Date in future-APPROVER IS Troy Steen and George Karabatsos
    [Tags]    C313650
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                              | Future date                 | MGR approval                    |  DD approval   
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM channel account oppty}  ${platform mgmt license product #3}    ${maintenance start date}   ${future maint amer mgr rule pm}     ${future maint amer dd rule}
         