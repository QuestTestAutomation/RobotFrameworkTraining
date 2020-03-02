*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval and PSO Approval

*** Variables ***
@{discount range}                     0    99.99
${id and sec mgmt product waiver}     DGM-VOL-TB-247    #ABG-VNT-PB
@{apj approvers}                      Gordon White
&{apj oi waiver rule}                 chain=Unchained Rule    rule=PSO APJ OI Approval    approvers=@{apj approvers}


*** Test Cases ***

Identity and Security Mgmt. APJ Direct Quote Professional Services Waiver
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C741228
    ${APJ direct account oppty USD}    ${id and sec mgmt product waiver}	${discount range}[0]	${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${id and sec mgmt product waiver}	${discount range}	    ${legal apj rule}	  ${apj oi waiver rule}
    ${APJ direct account oppty USD}    ${id and sec mgmt product waiver}	${discount range}[1]	${legal apj rule}	  ${apj oi waiver rule}
