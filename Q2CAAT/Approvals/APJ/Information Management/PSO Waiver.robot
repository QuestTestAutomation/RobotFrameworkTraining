*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval

*** Variables ***
@{discount range}               0    99.99
${inf mgmt product waiver}	    GBI-FOG-PB
@{apj approvers}                George Condos
&{apj im waiver rule}           chain=Unchained Rule    rule=PSO APJ IM Approval    approvers=@{apj approvers}


*** Test Cases ***

APJ Direct - IM - PSO required product approval is needed
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C741225
    ${APJ direct account oppty USD}    ${inf mgmt product waiver}	${discount range}[0]	${apj im waiver rule}
    ${APJ direct account oppty USD}    ${inf mgmt product waiver}	${discount range}	    ${apj im waiver rule}
    ${APJ direct account oppty USD}    ${inf mgmt product waiver}	${discount range}[1]	${apj im waiver rule}
