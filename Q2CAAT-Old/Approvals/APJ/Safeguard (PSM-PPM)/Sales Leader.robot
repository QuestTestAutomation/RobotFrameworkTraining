*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range}               20.01    30
${oid safeguard license}        SPO-SFG-PB-247    #SFM-SFG-TB-247
@{apj oi mgr approvers}         David Stepancich    #Boris Ivancic
&{apj oi mgr rule}              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{apj oi mgr approvers}
@{APJ leader approvers}         Boris Ivancic
&{APJ step 3 rule}              chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***
One identity Safeguard Product - Region APJ - Up to 30% Approvals should sent to Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader                                     
    [Tags]    C408747    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${oid safeguard license}         ${discount range}[0]       ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid safeguard license}         ${discount range}          ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid safeguard license}         ${discount range}[1]       ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
