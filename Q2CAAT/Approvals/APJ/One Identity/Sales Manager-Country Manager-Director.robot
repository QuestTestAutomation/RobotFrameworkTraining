*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}                      15.01    30
${one identity license product #1}     ABH-VNT-PB-247
${one identity license product #2}     EAP-DMZ-PB-247
${one identity license product #3}     QQA-EVI-PB
${one identity license product #4}     ABA-VNT-PB-247
@{apj oi mgr approvers}                David Stepancich    #Boris Ivancic
&{apj oi mgr rule}                     chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{apj oi mgr approvers}

*** Test Cases ***

One Identity Product - Region APJ - Up to 30% Approver is Sales Manager / Country Manager / Director
    [Tags]    C408804
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}        ${one identity license product #4}        ${discount range}[0]       ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${one identity license product #4}        ${discount range}          ${legal apj rule}       ${apj oi mgr rule}
    ${APJ direct account oppty USD}        ${one identity license product #4}        ${discount range}[1]       ${legal apj rule}       ${apj oi mgr rule}


    
