*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range}                              31.01    99.99
${platform mgmt prof services product}         MAW-DMX-PP
@{apj leader approvers}                        George Condos
&{apj leader rule}                             chain=Direct PS Sale Discount    rule=APJ PM Pro Services Leader Approval    approvers=@{apj leader approvers}
@{apj director approvers}                      George Condos    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
&{apj director rule}                           chain=Direct PS Sale Discount    rule=APJ PM Pro Services Director Approval    approvers=@{apj director approvers}
@{APJ quest pro services mgr rule approvers}   George Condos
&{APJ quest pro services mgr rule}	           chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	        approvers=@{APJ quest pro services mgr rule approvers}


*** Test Cases ***

Platform Mgmt. APJ Direct - Professional Services - More than 31% Discount - APPROVER IS Business Unit Pro Services Leader  
    [Tags]   C313527 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}[0]     ${apj director rule}    ${APJ quest pro services mgr rule}    ${apj leader rule}
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}        ${apj director rule}    ${APJ quest pro services mgr rule}    ${apj leader rule}
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}[1]     ${apj director rule}    ${APJ quest pro services mgr rule}    ${apj leader rule}
