*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with PSO Approval
Force Tags          non_standard_terms    pso_required

*** Variables ***
@{discount range}                   0    99.99
${uem pso product}                  CBA-KCE-CB-247-NBD    #OOA-KCE-PB-247    #PPA-KCE-PB-PRE
@{pso approvers}                    George Condos
&{pso rule}                         chain=Unchained Rule    rule=PSO APJ UEM Approval    approvers=@{pso approvers}

*** Test Cases ***

APJ - UEM - PSO required product approval is needed
    [Tags]    C741226
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct             | Discount              | Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${uem pso product}       ${discount range}        ${pso rule}