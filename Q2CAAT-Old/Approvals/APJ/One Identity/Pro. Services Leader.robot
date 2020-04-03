*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range USD}                          28.01    99.99
${id and sec mgmt prof services product}       IMG-VNT-CO
@{apj leader approvers}                        Gordon White
&{apj leader rule}                             chain=Direct PS Sale Discount    rule=APJ OI Pro Services Leader Approval    approvers=@{apj leader approvers}
@{apj director approvers}                      Stephen Herman
&{apj director rule}                           chain=Direct PS Sale Discount    rule=APJ OI Pro Services Director Approval    approvers=@{apj director approvers}
@{apj mgr approvers}                           George Condos
&{apj mgr rule}                                chain=Direct PS Sale Discount    rule=APJ OI Pro Services Manager Approval    approvers=@{apj mgr approvers}

*** Test Cases ***

Identity and Security Mgmt. APJ Direct - Professional Services - sold by day or per hour - scoping required - More than 28% - APPROVER is Business Unit Pro Services Leader
    [Tags]    C313547
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}[0]       ${legal apj rule}       ${apj director rule}    ${apj mgr rule}    ${apj leader rule}
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}          ${legal apj rule}       ${apj director rule}    ${apj mgr rule}    ${apj leader rule}
    ${APJ direct account oppty USD}        ${id and sec mgmt prof services product}        ${discount range USD}[1]       ${legal apj rule}       ${apj director rule}    ${apj mgr rule}    ${apj leader rule}
