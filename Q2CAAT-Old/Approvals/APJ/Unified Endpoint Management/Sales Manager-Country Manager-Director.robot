*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range USD}                             15.01    30
@{discount range USD KAAS}                        15.01    23
@{discount range USD MDM}                         15.01    23
@{discount range SGD}                             32.01    44
@{discount range SGD KAAS}                        32.01    38
@{discount range SGD MDM}                         32.01    38
@{discount range KRW}                             66.01    72
@{discount range KRW KAAS}                        66.01    69
@{discount range KRW MDM}                         66.01    69
@{discount range CNY}                             76.01    80
@{discount range CNY KAAS}                        76.01    78
@{discount range CNY MDM}                         76.01    78   
${uem kace portfolio license product 1}           DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}           FFB-KCE-TB
${uem kace portfolio license product 3}           GFX-RSC-TB
${uem kace kaas license products}                 JAC-KCE-TL
${uem kace cloud mdm}                             AAA-KCE-SAAS-247    
@{apj mgr approvers}                              David Stepancich    #Boris Ivancic
&{apj mgr rule}                                   chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{apj mgr approvers}

*** Test Cases ***

Unified Endpoint Management - KACE Portfolio - Region APJ - more than 66% to 72% (Korea Won) - Approval- "Sales Manager /Country Manager / Director"
    [Tags]    C408791
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${uem kace portfolio license product 1}        ${discount range KRW}[0]        ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace portfolio license product 1}        ${discount range KRW}           ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace portfolio license product 1}        ${discount range KRW}[1]        ${apj mgr rule}

Unified Endpoint Management - KACE Portfolio - Region APJ - more than 68% (Singapore Dollars) APJ Deal Desk, Regional Business Unit Sales Leader, Sales Manager / Country Manager / Director
    [Tags]    C408798
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 1}        ${discount range SGD}[0]        ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 1}        ${discount range SGD}           ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace portfolio license product 1}        ${discount range SGD}[1]        ${apj mgr rule}

Unified Endpoint Management APJ Direct - New Sales On-Prem License - KACE - More Than 15% to 30% Discount - Approval should sent to "Country Manager / Sales Manager / Director " .
    [Tags]    C313447
    ${APJ direct account oppty USD}        ${uem kace portfolio license product 1}        ${discount range USD}[0]        ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace portfolio license product 1}        ${discount range USD}           ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace portfolio license product 1}        ${discount range USD}[1]        ${apj mgr rule}
 
Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes)- APJ Direct - New Sales On-Prem License - More than 15% to 23% Discount - Sales Manager/Country Manager/Director   
#--------------------------------------------------------------------------------------------------------------------------
# Oppty                       `        |   Prodcuct                               |  Discount Range
#--------------------------------------------------------------------------------------------------------------------------  
    [Tags]    C632950
    ${APJ direct account oppty USD}        ${uem kace kaas license products}        ${discount range USD KAAS}[0]        ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace kaas license products}        ${discount range USD KAAS}           ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace kaas license products}        ${discount range USD KAAS}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes)- APJ Direct - New Sales On-Prem License - More than 32% to 38% (Singapore Dollars) Discount - Sales Manager/Country Manager/Director
    [Tags]    C632953
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${uem kace kaas license products}        ${discount range SGD KAAS}[0]        ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace kaas license products}        ${discount range SGD KAAS}           ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace kaas license products}        ${discount range SGD KAAS}[1]        ${apj mgr rule}
    
Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - more than 66% to 69% discount (Korea Won) - Sales Manager/Country Manager/Director
    [Tags]    C632956
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${uem kace kaas license products}        ${discount range KRW KAAS}[0]        ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace kaas license products}        ${discount range KRW KAAS}           ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace kaas license products}        ${discount range KRW KAAS}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - More than 76% to 78% discount (Chinese RMB) - Sales Manager/Country Manager/Director
    [Tags]    C632959
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${uem kace kaas license products}        ${discount range CNY KAAS}[0]        ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace kaas license products}        ${discount range CNY KAAS}           ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace kaas license products}        ${discount range CNY KAAS}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 15% to 23% Discount - Sales Manager / Country Manager / Director
    [Tags]    C632934
    ${APJ direct account oppty USD}        ${uem kace cloud mdm}        ${discount range USD MDM}[0]        ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace cloud mdm}        ${discount range USD MDM}           ${apj mgr rule}
    ${APJ direct account oppty USD}        ${uem kace cloud mdm}        ${discount range USD MDM}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 32% to 38% (Singapore Dollars) Discount - Sales Manager/Country Manager/Director
    [Tags]    C632938
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}        ${discount range SGD MDM}[0]        ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}        ${discount range SGD MDM}           ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${uem kace cloud mdm}        ${discount range SGD MDM}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - more than 66% to 69% discount (Korea Won) - Sales Manager/Country Manager/Director
    [Tags]    C632942
    ${APJ direct account oppty KRW}        ${uem kace cloud mdm}        ${discount range KRW MDM}[0]        ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace cloud mdm}        ${discount range KRW MDM}           ${apj mgr rule}
    ${APJ direct account oppty KRW}        ${uem kace cloud mdm}        ${discount range KRW MDM}[1]        ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 76% to 78% discount (Chinese RMB) - Sales Manager/Country Manager/Director
    [Tags]    C632946
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}        ${discount range CNY MDM}[0]        ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}        ${discount range CNY MDM}           ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace cloud mdm}        ${discount range CNY MDM}[1]        ${apj mgr rule}
            