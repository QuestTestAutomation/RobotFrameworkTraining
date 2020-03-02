*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range USD}                             0    15
@{discount range SGD}                             0    32
@{discount range KRW}                             0    66
@{discount range CNY}                             0    76
${uem kace portfolio license product 1}           DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}           FFB-KCE-TB
${uem kace portfolio license product 3}           GFX-RSC-TB
${uem kace kaas license product 1}                MAC-KCE-TL
${uem kace kaas license product 2}                JAC-KCE-TL
${uem kace cloud mdm}                             AAA-KCE-SAAS-247      


*** Test Cases ***
Unified Endpoint Management - KACE Portfolio - Region APJ - Up to 76% (Chinese RMB) Approval not required
    [Tags]    C408788
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 1}              ${discount range CNY}[0]
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 1}              ${discount range CNY}  
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 1}              ${discount range CNY}[1]

Unified Endpoint Management - KACE Portfolio - Region APJ - Up to 66% (Korea Won) Approval not required
    [Tags]    C408787
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------  
     ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}           ${discount range KRW}[0]
     ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}           ${discount range KRW}
     ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}           ${discount range KRW}[1]

Unified Endpoint Management - KACE Portfolio - Region APJ - Up to 32% (Singapore Dollars) Approval not required
    [Tags]    C408786
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 3}    ${discount range SGD}[0]
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 3}    ${discount range SGD}
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 3}    ${discount range SGD}[1]


 Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - up to 66% discount (Korea Won) - NO APPROVAL REQUIRED
    [Tags]    debug    C632955
    ${APJ direct account oppty KRW}       ${uem kace kaas license product 2}           ${discount range KRW}[0]
    ${APJ direct account oppty KRW}       ${uem kace kaas license product 2}           ${discount range KRW}
    ${APJ direct account oppty KRW}       ${uem kace kaas license product 2}           ${discount range KRW}[1]
 
Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - up to 76% discount (Chinese RMB) - NO APPROVAL REQUIRED.
    [Tags]    debug    C632958
    ${APJ direct account oppty CNY}        ${uem kace kaas license product 2}              ${discount range CNY}[0]
    ${APJ direct account oppty CNY}        ${uem kace kaas license product 2}              ${discount range CNY}  
    ${APJ direct account oppty CNY}        ${uem kace kaas license product 2}              ${discount range CNY}[1]

Unified Endpoint Management - SaaS - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - Up to 32% (Singapore Dollars) Discount - NO APPROVAL REQUIRED
    [Tags]    debug    C632952
    ${APJ direct account oppty SGD}        ${uem kace kaas license product 2}    ${discount range SGD}[0]
    ${APJ direct account oppty SGD}        ${uem kace kaas license product 2}    ${discount range SGD}
    ${APJ direct account oppty SGD}        ${uem kace kaas license product 2}    ${discount range SGD}[1]
    
Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - Up to 32% (Singapore Dollars) Discount - NO APPROVAL REQUIRED
    [Tags]    debug    C632937
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}    ${discount range SGD}[0]
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}    ${discount range SGD}
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}    ${discount range SGD}[1]
    
Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - up to 76% discount (Chinese RMB) - NO APPROVAL REQUIRED
    [Tags]    debug    C632945
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}              ${discount range CNY}[0]
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}              ${discount range CNY}  
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}              ${discount range CNY}[1]
    
Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - up to 66% discount (Korea Won) - NO APPROVAL REQUIRED
    [Tags]    debug    C632941
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}           ${discount range KRW}[0]
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}           ${discount range KRW}
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}           ${discount range KRW}[1]

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    debug    C632933
    ${APJ direct account oppty USD}      ${uem kace cloud mdm}          ${discount range USD}[0]
    ${APJ direct account oppty USD}      ${uem kace cloud mdm}          ${discount range USD}
    ${APJ direct account oppty USD}      ${uem kace cloud mdm}          ${discount range USD}[1]

Unified Endpoint Management -SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - up to 15% Discount - NO APPROVAL REQUIRED 
    [Tags]     debug    C632949       
    ${APJ direct account oppty USD}      ${uem kace kaas license product 2}          ${discount range USD}[0]
    ${APJ direct account oppty USD}      ${uem kace kaas license product 2}          ${discount range USD}
    ${APJ direct account oppty USD}      ${uem kace kaas license product 2}          ${discount range USD}[1]