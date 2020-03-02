*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval
Force Tags          non_standard_terms    pso_required

*** Variables ***
${oi pso product}              MEP-VOL-PB-247    #ODC-VOL-PB
@{amer pso approvers}          Gordon White
&{amer pso rule}               chain=Unchained Rule    rule=PSO AMER OI Approval    approvers=@{amer pso approvers}


@{emea pso approvers}          Gordon White
&{emea pso rule}               chain=Unchained Rule    rule=PSO EMEA OI Approval    approvers=@{emea pso approvers}

*** Test Cases ***

AMER - OI - PSO required product approval is needed
    [Tags]    C741235
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct            | Discount |     Legal Rule        |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
     ${LATAM direct account oppty}      ${oi pso product}        0          ${legal latam rule}     ${amer pso rule}
     ${NAM direct account oppty}        ${oi pso product}        0          ${legal us-can rule}    ${amer pso rule}
     

EMEA - OI - PSO required product approval is needed
    [Tags]   C741242 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct            | Discount |     Legal Rule        |  Rule
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${oi pso product}        0          ${legal emea rule}      ${emea pso rule}