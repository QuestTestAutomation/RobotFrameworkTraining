*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}	                           0.01    20
${id and sec mgmt prof services product 1}	   ARS-DMX-CO
${id and sec mgmt prof services product 2}	   IAP-VNT-PP
${id and sec mgmt prof services product 3}	   ARS-DMX-TR
@{nam oi pro mgr approvers}                    Ward Buchanan
@{emea oi pro mgr approvers}                          Alexander Klink
                                               ...    Chris Rudd
@{latam oi pro mgr approvers}                  Marcelo Luis
&{nam oi mgr rule}                             chain=Direct PS Sale Discount    rule=AMER OI Pro Services Manager Approval        approvers=@{nam oi pro mgr approvers}
&{emea oi mgr rule}                            chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Manager Approval      approvers=@{emea oi pro mgr approvers}
&{latam oi mgr rule}                           chain=Direct PS Sale Discount    rule=LATAM OI Pro Services Manager Approval     approvers=@{latam oi pro mgr approvers}

*** Test Cases ***

Identity and Security Mgmt. NAM Direct - Professional Services - Up to 20% Discount - Auto Approved- No approval required 
    [Tags]    C313536 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                      |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${id and sec mgmt prof services product 1}          ${discount range}[0]        ${legal us-can rule}    ${nam oi mgr rule}  
    ${NAM direct account oppty}         ${id and sec mgmt prof services product 1}          ${discount range}           ${legal us-can rule}    ${nam oi mgr rule} 
    ${NAM direct account oppty}         ${id and sec mgmt prof services product 1}          ${discount range}[1]        ${legal us-can rule}    ${nam oi mgr rule}
    
 
Identity and Security Mgmt. EMEA Direct- Professional Services - Up to 20% Discount - Auto Approved- No approval required
    [Tags]     debug    C313537    noproduct
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                      |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${id and sec mgmt prof services product 1}          ${discount range}[0]        ${legal emea rule}    ${emea oi mgr rule}
    ${EMEA direct account oppty}        ${id and sec mgmt prof services product 1}          ${discount range}           ${legal emea rule}    ${emea oi mgr rule} 
    ${EMEA direct account oppty}        ${id and sec mgmt prof services product 1}          ${discount range}[1]        ${legal emea rule}    ${emea oi mgr rule}
    
    
Identity and Security Mgmt. LATAM Direct - Professional Services - Up to 20% Discount - Auto Approved- No approval required
    [Tags]     C313538
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                      |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${id and sec mgmt prof services product 2}          ${discount range}[1]        ${legal latam rule}    ${latam oi mgr rule}  
    ${LATAM direct account oppty}       ${id and sec mgmt prof services product 2}          ${discount range}           ${legal latam rule}    ${latam oi mgr rule}
    ${LATAM direct account oppty}       ${id and sec mgmt prof services product 2}          ${discount range}[0]        ${legal latam rule}    ${latam oi mgr rule}