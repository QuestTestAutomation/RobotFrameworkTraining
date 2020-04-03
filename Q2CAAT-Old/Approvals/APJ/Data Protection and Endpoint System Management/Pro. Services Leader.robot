*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Pro Services Leader Approval and Manager Approval

*** Variables ***
@{discount range}	                            20.01	99.99
${data protection professional services}	    VCP-VZC-CO    #MXQ-SCS-CO
@{apj approvers}	                            George Condos
&{apj leader rule}	                            chain=Direct PS Sale Discount    rule=APJ DP Pro Services Leader Approval    approvers=@{apj approvers}
@{APJ quest pro services mgr rule approvers}	George Condos
&{APJ quest pro services mgr rule}	            chain=Direct PS Sale Discount    rule=APJ Quest Pro Services Manager Approval	        approvers=@{APJ quest pro services mgr rule approvers}

*** Test Cases ***

Data Protection APJ - Professional Services - sold by day or per hour - scoping required - Approval Over 20% Discount should be sent to "Business Unit Pro Services Leader"  
    [Tags]   C313471 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |    discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}         ${data protection professional services}	    ${discount range}[0]     ${apj leader rule}    ${APJ quest pro services mgr rule} 
    ${APJ direct account oppty USD}         ${data protection professional services}	    ${discount range}        ${apj leader rule}    ${APJ quest pro services mgr rule}
    ${APJ direct account oppty USD}         ${data protection professional services}	    ${discount range}[1]     ${apj leader rule}    ${APJ quest pro services mgr rule}
