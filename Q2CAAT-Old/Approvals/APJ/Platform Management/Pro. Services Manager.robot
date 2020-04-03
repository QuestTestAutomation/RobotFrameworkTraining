*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range USD}                          0.01    20
${platform mgmt prof services product}         GPH-DMX-CO
@{APJ quest pro services mgr rule approvers}   George Condos
&{APJ quest pro services mgr rule}	           chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	        approvers=@{APJ quest pro services mgr rule approvers}

*** Test Cases ***

Platform Mgmt. APJ Direct - Professional Services - Up to 20% Discount - Auto Approved -No Approval Required
    [Tags]    C313519
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${platform mgmt prof services product}            ${discount range USD}[0]    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}     ${platform mgmt prof services product}            ${discount range USD}       ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}     ${platform mgmt prof services product}            ${discount range USD}[1]    ${APJ quest pro services mgr rule}
    