*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval
Force Tags          pso_required

*** Variables ***
@{discount range}	        0    99.99
${NAM pm pso product}       AMF-MLX-PB-247    #NND-WGA-PB
${LATAM pm pso product}     MEU-QDT-TB-247    #MNT-WGA-PB-247
${EMEA pm pso product}	    NDF-WGA-PB-247    #NQD-WGA-PB
@{amer pso approvers}       Allison Inouye
&{amer pso rule}            chain=Unchained Rule    rule=PSO AMER PM Approval    approvers=@{amer pso approvers}


@{emea pso approvers}       Allison Inouye
&{emea pso rule}            chain=Unchained Rule    rule=PSO EMEA PM Approval    approvers=@{emea pso approvers}

*** Test Cases ***

Platform Mgmt. NAM Direct Quote Professional Services Waiver
    [Tags]    C313600
    ${NAM direct account oppty}	    ${NAM pm pso product}    ${discount range}[0]	${amer pso rule}
    ${NAM direct account oppty}	    ${NAM pm pso product}    ${discount range}    	${amer pso rule}
    ${NAM direct account oppty}	    ${NAM pm pso product}    ${discount range}[1]	${amer pso rule}

Platform Mgmt. LATAM Direct Quote Professional Services Waiver
    [Tags]    C313602
    ${LATAM direct account oppty}	${LATAM pm pso product}    ${discount range}[0]	${amer pso rule}
    ${LATAM direct account oppty}	${LATAM pm pso product}    ${discount range}    	${amer pso rule}
    ${LATAM direct account oppty}	${LATAM pm pso product}    ${discount range}[1]	${amer pso rule}
 
 EMEA - PM - PSO required product approval is needed
    [Tags]    C741241
    ${EMEA direct account oppty}    ${EMEA pm pso product}    ${discount range}[0]   ${emea pso rule}
    ${EMEA direct account oppty}    ${EMEA pm pso product}    ${discount range}      ${emea pso rule}
    ${EMEA direct account oppty}    ${EMEA pm pso product}    ${discount range}[1]   ${emea pso rule}
     