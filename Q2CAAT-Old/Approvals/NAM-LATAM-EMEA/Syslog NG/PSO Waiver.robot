*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}               0    99.99
${syslog product waiver}	    BAK-TS4-PB-247
@{americas approvers}           Gordon White
&{americas oi waiver rule}      chain=Unchained Rule    rule=PSO AMER OI Approval    approvers=@{americas approvers}
@{emea approvers}	            Gordon White
&{emea oi waiver rule}          chain=Unchained Rule    rule=PSO EMEA OI Approval    approvers=@{emea approvers}

*** Test Cases ***
AMER - Syslog NG - PSO required product approval is needed
    [Tags]    C741237    debug    noproduct
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct               |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}	    ${syslog product waiver}	${discount range}[0]	${legal us-can rule}	${americas oi waiver rule}
    ${NAM direct account oppty}	    ${syslog product waiver}	${discount range}	    ${legal us-can rule}	${americas oi waiver rule}
    ${LATAM direct account oppty}	${syslog product waiver}	${discount range}[1]	${legal latam rule}	    ${americas oi waiver rule}

EMEA - Syslog NG - PSO required product approval is needed
    [Tags]    C741244    debug    noproduct
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct               |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}	${syslog product waiver}	${discount range}[0]	${legal emea rule}	    ${emea oi waiver rule}
    ${EMEA direct account oppty}	${syslog product waiver}	${discount range}	    ${legal emea rule}	    ${emea oi waiver rule}
    ${EMEA direct account oppty}	${syslog product waiver}	${discount range}[1]	${legal emea rule}	    ${emea oi waiver rule}
    