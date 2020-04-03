*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}               10.01    20
${oid safeguard license}        SPO-SFG-PB-247    #SFM-SFG-TB-247
@{apj oi mgr approvers}         David Stepancich    #Boris Ivancic
&{apj oi mgr rule}              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{apj oi mgr approvers}

*** Test Cases ***

One identity Safeguard Product - Region APJ - Up to 20% Approver is "Sales Manager/Country Manager/Director"
    [Tags]    C408746
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}        ${oid safeguard license}        ${discount range}[0]        ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid safeguard license}        ${discount range}           ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid safeguard license}        ${discount range}[1]        ${legal apj rule}       ${apj oi mgr rule}


    
