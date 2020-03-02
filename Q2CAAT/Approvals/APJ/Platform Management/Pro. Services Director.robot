*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                                20.01    31.00
${platform mgmt prof services product}           NAN-WGA-CO    #WWB-SCL-PP    #DAF-BKB-CO
@{apj director approvers}                        George Condos    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
&{apj director rule}                             chain=Direct PS Sale Discount    rule=APJ PM Pro Services Director Approval    approvers=@{apj director approvers}
@{APJ quest pro services mgr rule approvers}	 George Condos
&{APJ quest pro services mgr rule}	             chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	        approvers=@{APJ quest pro services mgr rule approvers}


*** Test Cases ***

Platform Mgmt. APJ Direct - Professional Services - more than 20% to 31% Discount - Pro. Services Director  
    [Tags]   C313523 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}[0]     ${apj director rule}    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}        ${apj director rule}    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}         ${platform mgmt prof services product}          ${discount range}[1]     ${apj director rule}    ${APJ quest pro services mgr rule}
