*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval

*** Variables ***
@{discount range}                   0    99.99
${platform mgmt product waiver}	    AMF-MLX-TB-247
@{apj approvers}                    George Condos
&{apj pm waiver rule}               chain=Unchained Rule    rule=PSO APJ PM Approval    approvers=@{apj approvers}


*** Test Cases ***

APJ Direct - PM - PSO required product approval is needed
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C741227
    ${APJ direct account oppty USD}    ${platform mgmt product waiver}	${discount range}[0]	${apj pm waiver rule}
    ${APJ direct account oppty USD}    ${platform mgmt product waiver}	${discount range}	    ${apj pm waiver rule}
    ${APJ direct account oppty USD}    ${platform mgmt product waiver}	${discount range}[1]	${apj pm waiver rule}
