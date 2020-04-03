*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval    #Create Quote with No Approval Required

*** Variables ***
@{discount range USD}                           0.01    20
${data protection professional services}        APC-SCL-CO    #AAQ-KCE-PP     #QSE-KCE-PP    #APA-APP-PP
@{APJ quest pro services mgr rule approvers}	George Condos
&{APJ quest pro services mgr rule}	            chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	        approvers=@{APJ quest pro services mgr rule approvers}

*** Test Cases ***

Data Protection APJ - Professional Services - sold by day or per hour - scoping required - Up to 20% Discount
    [Tags]    C313467
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${data protection professional services}          ${discount range USD}[0]	    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}     ${data protection professional services}          ${discount range USD}	        ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}     ${data protection professional services}          ${discount range USD}[1]	    ${APJ quest pro services mgr rule}  
    