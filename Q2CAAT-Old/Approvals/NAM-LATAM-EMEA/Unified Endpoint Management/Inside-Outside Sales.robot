*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range kace portfolio}                  0    15
@{discount range kace kaas}                       0    15
@{discount range kace cloud mdm}                  0    15
${uem kace portfolio license product 1}           DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}           FFB-KCE-TB
${uem kace portfolio license product 3}           AMF-KCE-TB
${uem kace portfolio license product 4}           GFX-RSC-TB
${uem kace kaas license product 1}                JIE-KCE-TB    #, JAC-KCE-TL
${uem kace cloud mdm}                             AAA-KCE-SAAS-247    #no products found in tst          

*** Test Cases ***

Unified Endpoint Management NAM Direct - New Sales On-Prem License - KACE - Up to 15% Discount - NO APPROVAL REQUIRED                             
    [Tags]    C313444    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}[0]
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}[1]
  
    
    
Unified Endpoint Management EMEA Direct - New Sales On-Prem License - KACE - Up to 15% Discount - NO APPROVAL REQUIRED                            
    [Tags]    C313445
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  discount range kace portfolio
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}[0]
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}[1]
 
    
    
Unified Endpoint Management LATAM Direct - New Sales On-Prem License - KACE - Up to 15% Discount - NO APPROVAL REQUIRED                          
    [Tags]    C313446
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  discount range kace portfolio
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}[0]
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}[1]


   
Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    debug    C632917
    ${NAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[0]        
    ${NAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}
    ${NAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[1]
    

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    debug    C632926
    ${EMEA direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[0]        
    ${EMEA direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}
    ${EMEA direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[1]

    
Unified Endpoint Management LATAM Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    debug    nocase
    ${LATAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[0]        
    ${LATAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}
    ${LATAM direct account oppty}        ${uem kace kaas license product 1}        ${discount range kace kaas}[1]
  
    
Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    C632929
    ${EMEA direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[0]        
    ${EMEA direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}
    ${EMEA direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[1]


Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    C632921
    ${NAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[0]        
    ${NAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}
    ${NAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[1]
    
    
Unified Endpoint Management LATAM Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - Up to 15% Discount - NO APPROVAL REQUIRED
    [Tags]    debug    nocase
    ${LATAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[0]        
    ${LATAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}
    ${LATAM direct account oppty}        ${uem kace cloud mdm}        ${discount range kace cloud mdm}[1]
