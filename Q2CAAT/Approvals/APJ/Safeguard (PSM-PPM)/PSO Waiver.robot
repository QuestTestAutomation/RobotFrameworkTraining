*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}                     0    99.99
${safeguard product waiver}           SPO-SFG-PB-247
@{apj approvers}                      Gordon White
&{apj oi waiver rule}                 chain=Unchained Rule    rule=PSO APJ OI Approval    approvers=@{apj approvers}


*** Test Cases ***

APJ - Safeguard (PSM-PPM) - PSO required product approval is needed
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    debug    C741229    noproduct
    ${APJ direct account oppty USD}    ${safeguard product waiver}	${discount range}[0]	${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${safeguard product waiver}	${discount range}	    ${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${safeguard product waiver}	${discount range}[1]	${legal apj rule}	  ${apj oi waiver rule}
