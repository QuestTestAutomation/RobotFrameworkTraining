*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval
Force Tags          pso_required

*** Variables ***
@{discount range}	        0    99.99
${im pso product}	        FHC-FOG-PB
@{amer pso approvers}	    Mark Gowdy
&{amer pso rule}	        chain=Unchained Rule    rule=PSO AMER IM Approval    approvers=@{amer pso approvers}


@{emea pso approvers}       Ales Zeman
&{emea pso rule}            chain=Unchained Rule    rule=PSO EMEA IM Approval    approvers=@{emea pso approvers}

*** Test Cases ***

Information Mgmt. NAM Direct Quote Professional Services Waiver
    [Tags]    C313596
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct              |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}          ${im pso product}	${discount range}[0]    ${amer pso rule}
    ${NAM direct account oppty}          ${im pso product}	${discount range}       ${amer pso rule}
    ${NAM direct account oppty}          ${im pso product}	${discount range}[1]    ${amer pso rule}    

Information Mgmt. LATAM Direct Quote Professional Services Waiver
    [Tags]    C313598
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct              |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}        ${im pso product}	${discount range}[0]    ${amer pso rule}
    ${LATAM direct account oppty}        ${im pso product}	${discount range}       ${amer pso rule}
    ${LATAM direct account oppty}        ${im pso product}	${discount range}[1]    ${amer pso rule}

 
 EMEA - IM - PSO required product approval is needed
    [Tags]    C741239
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                         |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}         ${im pso product}	${discount range}[0]    ${emea pso rule}
    ${EMEA direct account oppty}         ${im pso product}	${discount range}       ${emea pso rule}
    ${EMEA direct account oppty}         ${im pso product}	${discount range}[1]    ${emea pso rule}
     