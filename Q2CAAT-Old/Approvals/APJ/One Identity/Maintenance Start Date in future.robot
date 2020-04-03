*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create OID Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${inf mgmt license product}            AAX-DMX-PS

@{future maint apj mgr approvers oi}     David Stepancich
    
&{future maint apj mgr rule oi}          chain=Future Maintenance    
                                         ...    rule=Global Sales Manager Approval - OI    
                                         ...    approvers=@{future maint apj mgr approvers oi}      children=true 

*** Test Cases ***
Identity and Security Mgmt. APJ Direct Quote Maintenance Start Date in future-APPROVER IS Troy Steen
    [Tags]    C313643
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                     | Future date                | MGR approval                    |  DD approval                   |  Legal approval            
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}    ${inf mgmt license product}    ${maintenance start date}    ${future maint apj mgr rule oi}    ${future maint apj dd rule}     ${legal apj rule} 
    
Identity and Security Mgmt. APJ Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313659
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                     | Future date                | MGR approval                    |  DD approval                   |  Legal approval            
 #---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ channel account oppty SGD}    ${inf mgmt license product}    ${maintenance start date}    ${future maint apj mgr rule oi}    ${future maint apj dd rule}     ${legal apj rule} 
        
  