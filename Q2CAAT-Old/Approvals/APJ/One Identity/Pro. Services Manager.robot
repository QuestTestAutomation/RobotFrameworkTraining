*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range USD}                          0.01    20
${id and sec mgmt prof services product}       IMG-VNT-CO
@{apj approvers}                               George Condos
&{apj oi mgr rule}                             chain=Direct PS Sale Discount    rule=APJ OI Pro Services Manager Approval    approvers=@{apj approvers}

*** Test Cases ***

Identity and Security Mgmt. APJ Direct- Professional Services - sold by day or per hour - scoping required - Up to 20% Discount
    [Tags]    C313539
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${id and sec mgmt prof services product}         ${discount range USD}[0]         ${legal apj rule}    ${apj oi mgr rule}  
    ${APJ direct account oppty USD}     ${id and sec mgmt prof services product}         ${discount range USD}            ${legal apj rule}    ${apj oi mgr rule}
    ${APJ direct account oppty USD}     ${id and sec mgmt prof services product}         ${discount range USD}[1]         ${legal apj rule}    ${apj oi mgr rule}
    