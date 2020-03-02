*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range USD}                          20.01    28
${id and sec mgmt prof services product}       IMG-VNT-CO
@{apj pro mgr approvers}                       George Condos
&{apj oi pro mgr rule}                         chain=Direct PS Sale Discount    rule=APJ OI Pro Services Manager Approval    approvers=@{apj pro mgr approvers}
@{apj pro director approvers}                  Stephen Herman
&{apj pro director rule}                       chain=Direct PS Sale Discount    rule=APJ OI Pro Services Director Approval   approvers=@{apj pro director approvers}


*** Test Cases ***

Identity and Security Mgmt. APJ Direct - Professional Services - sold by day or per hour - scoping required - More than 20% to 28% Discount - Pro. Services Director
    [Tags]    C313543
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}[0]       ${legal apj rule}    ${apj pro director rule}    ${apj oi pro mgr rule}
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}          ${legal apj rule}    ${apj pro director rule}    ${apj oi pro mgr rule}
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}[1]       ${legal apj rule}    ${apj pro director rule}    ${apj oi pro mgr rule}
