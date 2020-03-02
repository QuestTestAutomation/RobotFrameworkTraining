*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}	        0    99.99
${syslog product waiver}	BAK-TS4-PB-247
@{apj approvers}	        Gordon White
&{apj oi waiver rule}	    chain=Unchained Rule    rule=PSO APJ OI Approval    approvers=@{apj approvers}


*** Test Cases ***

APJ - Safeguard (PSM-PPM) - PSO required product approval is needed
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C741230    debug    noproduct
    ${APJ direct account oppty USD}    ${syslog product waiver}	    ${discount range}[0]	${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${syslog product waiver}	    ${discount range}	    ${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${syslog product waiver}	    ${discount range}[1]	${legal apj rule}	  ${apj oi waiver rule}
