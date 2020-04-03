*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval
Force Tags          pso_required

*** Variables ***
@{discount range}	        0    99.99
${uem pso product}          CBA-KCE-CB-247-NBD    #AMF-KCE-TB
@{amer pso approvers}              Mark Gonzales
                            ...    David Matar
&{amer pso rule}            chain=Unchained Rule    rule=PSO AMER/EMEA UEM Approval    approvers=@{amer pso approvers}


@{emea pso approvers}              Mark Gonzales
                            ...    David Matar
&{emea pso rule}            chain=Unchained Rule    rule=PSO AMER/EMEA UEM Approval    approvers=@{emea pso approvers}

*** Test Cases ***

AMER - UEM - PSO required product approval is needed
    [Tags]    C741233
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct              |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}        ${uem pso product}    ${discount range}[0]	    ${amer pso rule}
    ${LATAM direct account oppty}        ${uem pso product}    ${discount range}	    ${amer pso rule}
    ${LATAM direct account oppty}        ${uem pso product}    ${discount range}[1]	    ${amer pso rule}
    ${NAM direct account oppty}          ${uem pso product}    ${discount range}[0]	    ${amer pso rule}
    ${NAM direct account oppty}          ${uem pso product}    ${discount range}	    ${amer pso rule}
    ${NAM direct account oppty}          ${uem pso product}    ${discount range}[1]	    ${amer pso rule}    
 
 EMEA - UEM - PSO required product approval is needed
    [Tags]    C741240
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                         |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}         ${uem pso product}    ${discount range}[0]	    ${emea pso rule}
    ${EMEA direct account oppty}         ${uem pso product}    ${discount range}	    ${emea pso rule}    
    ${EMEA direct account oppty}         ${uem pso product}    ${discount range}[1]	    ${emea pso rule}     