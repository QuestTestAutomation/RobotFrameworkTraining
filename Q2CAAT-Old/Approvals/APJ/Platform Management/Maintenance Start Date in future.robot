*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${platform mgmt license product #2}      AAA-SCL-PS 

@{future maint apj mgr approvers pm}     David Stepancich
    
&{future maint apj mgr rule pm}          chain=Future Maintenance    
                                         ...    rule=Global Sales Manager Approval - PM    
                                         ...    approvers=@{future maint apj mgr approvers pm}      children=true 
 

*** Test Cases ***
Platform Mgmt. APJ Direct Quote Maintenance Start Date in future-APPROVER IS Troy Steen
    [Tags]    C313635
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                           | Future date                   | MGR approvals                  |  DD approval               
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty SGD}    ${platform mgmt license product #2}    ${maintenance start date}    ${future maint apj mgr rule pm}    ${future maint apj dd rule}
    
Platform Mgmt. APJ Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313651
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                          |   Product                           | Future date                   | MGR approvals                  |  DD approval               
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${APJ channel account oppty USD}    ${platform mgmt license product #2}    ${maintenance start date}    ${future maint apj mgr rule pm}    ${future maint apj dd rule}
     