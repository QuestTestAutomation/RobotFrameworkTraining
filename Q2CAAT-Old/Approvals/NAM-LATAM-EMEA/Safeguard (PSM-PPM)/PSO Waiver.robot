*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}               0    99.99
${safeguard product waiver}	    SPO-SFG-PB-247
@{americas approvers}           Gordon White
&{americas oi waiver rule}      chain=Unchained Rule    rule=PSO AMER OI Approval    approvers=@{americas approvers}
@{emea pso approvers}           Gordon White
&{emea pso rule}                chain=Unchained Rule    rule=PSO EMEA OI Approval    approvers=@{emea pso approvers}


*** Test Cases ***
AMER - Safeguard (PSM-PPM) - PSO required product approval is needed
    [Tags]    debug    C741236    noproduct
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}	    ${safeguard product waiver}	    ${discount range}[0]	${legal us-can rule}	${americas oi waiver rule}
    ${NAM direct account oppty}	    ${safeguard product waiver}	    ${discount range}	    ${legal us-can rule}	${americas oi waiver rule}
    ${LATAM direct account oppty}	${safeguard product waiver}	    ${discount range}[1]	${legal latam rule}	    ${americas oi waiver rule}

EMEA - Safeguard (PSM-PPM) - PSO required product approval is needed
    [Tags]    debug    C741243    noproduct
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}	${safeguard product waiver}	    ${discount range}[0]	${legal emea rule}	${emea pso rule}
    ${EMEA direct account oppty}	${safeguard product waiver}	    ${discount range}	    ${legal emea rule}	${emea pso rule}
    ${EMEA direct account oppty}	${safeguard product waiver}	    ${discount range}[1]	${legal emea rule}	${emea pso rule}
