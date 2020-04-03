*** Settings ***
Resource            ../../../Approvals Keywords.robot
Documentation       No PSO required safeguard products 
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval
Force Tags          non_standard_terms    pso_required

*** Variables ***
${oi safeguard pso product}      DAX-BAL-PB-247
@{pso approvers}                 Gordon White
&{pso rule}                      chain=Unchained Rule    rule=PSO APJ OI Approval    approvers=@{pso approvers}

*** Test Cases ***

APJ - Safeguard (PSM-PPM) - PSO required product approval is needed
    [Tags]    C741229    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       | Discount |   Legal Rule         |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${oi safeguard pso product}        0          ${legal apj rule}    ${pso rule}