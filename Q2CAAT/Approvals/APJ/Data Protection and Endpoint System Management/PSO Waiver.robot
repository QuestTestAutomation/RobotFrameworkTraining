*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval

*** Variables ***
@{discount range}           0    99.99
${dp product waiver}	    ADS-BAK-PB-247-5YR    #SBE-BAK-TB-247
@{apj approvers}            George Condos
&{apj dp waiver rule}       chain=Unchained Rule    rule=PSO APJ DP Approval    approvers=@{apj approvers}


*** Test Cases ***

APJ Direct - DP - PSO required product approval is needed
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    [Tags]    C741224
    ${APJ direct account oppty USD}    ${dp product waiver}	    ${discount range}[0]	${apj dp waiver rule}
    ${APJ direct account oppty USD}    ${dp product waiver}	    ${discount range}	    ${apj dp waiver rule}
    ${APJ direct account oppty USD}    ${dp product waiver}	    ${discount range}[1]	${apj dp waiver rule}
