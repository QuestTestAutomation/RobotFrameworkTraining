*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range kace portfolio}                  15.01    30
@{discount range kace kaas}                       15.01    23    
@{discount range kace cloud mdm}                  15.01    23
${uem kace portfolio license product 1}           DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}           DDB-SCL-PB    #FFB-KCE-TB
${uem kace portfolio license product 3}           DDB-SCL-PB    #AMF-KCE-TB
${uem kace portfolio license product 4}           GFX-RSC-TB
${uem kace kaas license product 1}                JIE-KCE-TB    #, JAC-KCE-TL
${uem kace cloud mdm}                             AAA-KCE-SAAS-247    #no products found in tst          
@{americas approvers}                             David Stepancich    #Spencer Hopps    David Grun    Brian Jones    Marco Fontenelle
@{emea approvers}                                 David Stepancich    #Oliver Stairmand
&{americas mgr rule}                              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{americas approvers}
&{emea mgr rule}                                  chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{emea approvers}
#Set Global Variable    ${direct new sale chain}                       Direct New Sale Discount
#Set Global Variable    ${nam emea sales mgr rule}                     Sales Manager / Country Manager / Director Approval NAM/EMEA


*** Test Cases ***

Unified Endpoint Management NAM Direct - New Sales On-Prem License - KACE - More than 15% to 30% Discount - APPROVER IS SALES REP MGR
    [Tags]    C313448
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}[0]        ${americas mgr rule}
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}           ${americas mgr rule}
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}          ${discount range kace portfolio}[1]        ${americas mgr rule}
    
    
Unified Endpoint Management EMEA Direct - New Sales On-Prem License - KACE - More than 15% to 30% Discount- APPROVED BY "Sales Manager / Country Manager / Director
    [Tags]    C313449
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}           ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}          ${discount range kace portfolio}[1]        ${emea mgr rule}

Unified Endpoint Management LATAM Direct - New Sales On-Prem License - KACE - More than 15% to 30% Discount- APPROVER IS SALES REP MGR
    [Tags]    C313450
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}           ${americas mgr rule}
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}          ${discount range kace portfolio}[1]        ${americas mgr rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - More than 15% to 23% Discount - Approval to be sent to Sales Manager / Country Manager / Director
    [Tags]    debug    C632927
    ${EMEA direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}           ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[1]        ${emea mgr rule}

Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - More than 15% to 23% Discount - Approval to be sent to Sales Manager / Country Manager / Director
    [Tags]    debug    C632918
    ${NAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[0]        ${americas mgr rule}
    ${NAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}           ${americas mgr rule}
    ${NAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[1]        ${americas mgr rule}
 
Unified Endpoint Management LATAM Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - More than 15% to 23% Discount - Approval to be sent to Sales Manager / Country Manager / Director
    [Tags]    debug    nocase
    ${LATAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}           ${americas mgr rule}
    ${LATAM direct account oppty}      ${uem kace kaas license product 1}          ${discount range kace kaas}[1]        ${americas mgr rule}
    
Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - More than 15% to 23% Discount - APPROVAL should be sent to Sales Manager / Country Manager / Director
    [Tags]    C632930
    ${EMEA direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}           ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[1]        ${emea mgr rule}
 
Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - More than 15% to 23% Discount - APPROVAL should be sent to ales Manager / Country Manager / Director
    [Tags]    C632922
    ${NAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[0]        ${americas mgr rule}
    ${NAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}           ${americas mgr rule}
    ${NAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[1]        ${americas mgr rule}

Unified Endpoint Management LATAM Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) - More than 15% to 23% Discount - APPROVAL should be sent to ales Manager / Country Manager / Director
    [Tags]    debug    nocase
    ${LATAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}           ${americas mgr rule}
    ${LATAM direct account oppty}      ${uem kace cloud mdm}          ${discount range kace cloud mdm}[1]        ${americas mgr rule}
 

    