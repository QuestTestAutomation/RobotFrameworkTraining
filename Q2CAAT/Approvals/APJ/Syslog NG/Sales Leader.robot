*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range}               30.01    60
${oid syslog license}           BAA-BAL-CB
@{apj oi mgr approvers}         David Stepancich    #Boris Ivancic
&{apj oi mgr rule}              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{apj oi mgr approvers}
@{APJ leader approvers}         Boris Ivancic
&{APJ step 3 rule}              chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***
One identity syslog Product - Region APJ - Up to 60% - Approval should be send to Country Manager/Sales Manager/Director , Regional Business Unit Sales Leader                                     
    [Tags]    C408751    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${oid syslog license}         ${discount range}[0]       ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid syslog license}         ${discount range}          ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${oid syslog license}         ${discount range}[1]       ${legal apj rule}     ${APJ step 3 rule}    ${apj oi mgr rule}
