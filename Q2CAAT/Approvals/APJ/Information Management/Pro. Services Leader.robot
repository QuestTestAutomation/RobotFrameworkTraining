*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Pro Services Leader Approval and Manager Approval

*** Variables ***
@{discount range}	                            20.01    99.99
${inf mgmt prof services product}	            PMT-SPX-CO
@{apj approvers}	                            George Condos
&{apj leader rule}	                            chain=Direct PS Sale Discount    rule=APJ IM Pro Services Leader Approval	    approvers=@{apj approvers}
@{APJ quest pro services mgr rule approvers}	George Condos
&{APJ quest pro services mgr rule}	            chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	approvers=@{APJ quest pro services mgr rule approvers}

*** Test Cases ***

Information Mgmt. APJ Direct - Professional Services - More than 20% Discount - Business Unit Pro Services Leader  
    [Tags]   C313515 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}       ${inf mgmt prof services product}          ${discount range}[0]     ${apj leader rule}    ${APJ quest pro services mgr rule} 
    ${APJ direct account oppty USD}       ${inf mgmt prof services product}          ${discount range}        ${apj leader rule}    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}       ${inf mgmt prof services product}          ${discount range}[1]     ${apj leader rule}    ${APJ quest pro services mgr rule}
