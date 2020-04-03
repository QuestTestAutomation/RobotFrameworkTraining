*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}               15.01    30
${oid syslog license}           BAA-BAL-CB
@{apj oi mgr approvers}         David Stepancich    #Boris Ivancic
&{apj oi mgr rule}              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{apj oi mgr approvers}

*** Test Cases ***

One identity syslog Product - Region APJ - Up to 30% Approver is "Sales Manager/Country Manager/Director"
    [Tags]    C408750
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}        ${oid syslog license}        ${discount range}[0]        ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid syslog license}        ${discount range}           ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid syslog license}        ${discount range}[1]        ${legal apj rule}       ${apj oi mgr rule}


    
