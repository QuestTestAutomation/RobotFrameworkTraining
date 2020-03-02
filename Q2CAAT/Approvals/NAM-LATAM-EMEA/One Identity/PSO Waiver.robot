*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}                      0    99.99
${id and sec mgmt product waiver}      UPA-PGO-PB    #OPB-VNT-PB
${id and sec mgmt product waiver 2}    AAB-DMX-PB
@{americas approvers}                  Gordon White
&{americas oi waiver rule}             chain=Unchained Rule    rule=PSO AMER OI Approval    approvers=@{americas approvers}


*** Test Cases ***
Identity and Security Mgmt. NAM Direct Quote Professional Services Waiver
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C313608
    ${NAM direct account oppty}	    ${id and sec mgmt product waiver 2}	${discount range}[0]	${legal us-can rule}	${americas oi waiver rule}
    ${NAM direct account oppty}	    ${id and sec mgmt product waiver 2}	${discount range}	    ${legal us-can rule}	${americas oi waiver rule}
    ${NAM direct account oppty}	    ${id and sec mgmt product waiver 2}	${discount range}[1]	${legal us-can rule}	${americas oi waiver rule}
    
Identity and Security Mgmt. LATAM Direct Quote Professional Services Waiver
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C313610
    ${LATAM direct account oppty}	${id and sec mgmt product waiver}	${discount range}[0]	${legal latam rule}	    ${americas oi waiver rule}
    ${LATAM direct account oppty}	${id and sec mgmt product waiver}	${discount range}	    ${legal latam rule}	    ${americas oi waiver rule}
    ${LATAM direct account oppty}	${id and sec mgmt product waiver}	${discount range}[1]	${legal latam rule}	    ${americas oi waiver rule}
