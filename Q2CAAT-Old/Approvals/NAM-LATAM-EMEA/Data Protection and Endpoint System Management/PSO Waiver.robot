*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval
Force Tags          pso_required

*** Variables ***
@{discount range}	                0    99.99
${data protection pso product}      VSM-FOG-PB
@{amer pso approvers}               Scott Hetrick
&{amer pso rule}                    chain=Unchained Rule    rule=PSO AMER DP Approval    approvers=@{amer pso approvers}


@{emea pso approvers}               Scott Hetrick
&{emea pso rule}                    chain=Unchained Rule    rule=PSO EMEA DP Approval    approvers=@{emea pso approvers}

*** Test Cases ***
Data Protection NAM Direct Quote Professional Services Waiver
    [Tags]    C313604
    ${NAM direct account oppty}	    ${data protection pso product}    ${discount range}[0]	${amer pso rule}
    ${NAM direct account oppty}	    ${data protection pso product}    ${discount range}    	${amer pso rule}
    ${NAM direct account oppty}	    ${data protection pso product}    ${discount range}[1]	${amer pso rule}


Data Protection LATAM Direct Quote Professional Services Waiver
    [Tags]    C313606
    ${LATAM direct account oppty}	${data protection pso product}    ${discount range}[0]	${amer pso rule}
    ${LATAM direct account oppty}	${data protection pso product}    ${discount range}	    ${amer pso rule}
    ${LATAM direct account oppty}	${data protection pso product}    ${discount range}[1]	${amer pso rule}

 
 EMEA - DP - PSO required product approval is needed
    [Tags]    C741238
    ${EMEA direct account oppty}	${data protection pso product}    ${discount range}[0]	${emea pso rule}
    ${EMEA direct account oppty}	${data protection pso product}    ${discount range}		${emea pso rule}
    ${EMEA direct account oppty}	${data protection pso product}    ${discount range}[1]	${emea pso rule}
     