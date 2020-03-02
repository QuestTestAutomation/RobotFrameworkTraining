*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${inf mgmt license product #2}           DB2-TOD-PS

@{future maint apj mgr approvers im}     David Stepancich
    
&{future maint apj mgr rule im}          chain=Future Maintenance    
                                         ...    rule=Global Sales Manager Approval - IM    
                                         ...    approvers=@{future maint apj mgr approvers im}      children=true
 

*** Test Cases ***
Information Mgmt. APJ Direct Quote Maintenance Start Date in future - APPROVER IS Troy Steen
    [Tags]    C313631
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                         |   Product                        | Future date                | MGR approval                      |  DD approval            
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty CNY}    ${inf mgmt license product #2}    ${maintenance start date}    ${future maint apj mgr rule im}    ${future maint apj dd rule}
    
 Information Mgmt. APJ Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
     [Tags]    C313647
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                         |   Product                        | Future date                | MGR approval                      |  DD approval            
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty CNY}    ${inf mgmt license product #2}    ${maintenance start date}    ${future maint apj mgr rule im}    ${future maint apj dd rule}
     