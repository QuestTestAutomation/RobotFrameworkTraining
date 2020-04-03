*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${data protection dl license product}          ADB-APP-PS-247

@{future maint apj mgr approvers dp}           David Stepancich
    
&{future maint apj mgr rule dp}                chain=Future Maintenance    
                                               ...    rule=Global Sales Manager Approval - DP    
                                               ...    approvers=@{future maint apj mgr approvers dp}      children=true
 

*** Test Cases ***
Data Protection APJ Direct Quote Maintenance Start Date in future-APPROVER IS Troy Steen
    [Tags]    C313639
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                                | Future date                | MGR approval                    | DD appproval             
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}    ${data protection dl license product}    ${maintenance start date}     ${future maint apj mgr rule dp}    ${future maint apj dd rule}
    
Data Protection APJ Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313655
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                                | Future date                | MGR approval                    | DD appproval             
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ channel account oppty KRW}    ${data protection dl license product}    ${maintenance start date}     ${future maint apj mgr rule dp}    ${future maint apj dd rule}
       