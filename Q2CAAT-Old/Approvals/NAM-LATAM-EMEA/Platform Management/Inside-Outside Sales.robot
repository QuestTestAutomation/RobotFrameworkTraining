*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range}                          0    15
${platform mgmt license product #1}        SCP-SV3-PB-SRP
${platform mgmt license product #2}        MEY-DMX-PB    #MEU-QDT-TB-247
${platform mgmt license product #3}        SFA-SCL-PB-247


*** Test Cases ***
  
Platform Mgmt. NAM Direct - New Sales On-Prem License                                     
    [Tags]    C313396   
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                            |   Prodcuct                                |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${NAM direct account oppty}       ${platform mgmt license product #1}         ${discount range}[0]
    ${NAM direct account oppty}       ${platform mgmt license product #1}         ${discount range}
    ${NAM direct account oppty}       ${platform mgmt license product #1}         ${discount range}[1]
    
    
Platform Mgmt. EMEA Direct - New Sales On-Prem License                                    
    [Tags]    C313397    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                            |   Prodcuct                                |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${EMEA direct account oppty}      ${platform mgmt license product #2}         ${discount range}[0]
    ${EMEA direct account oppty}      ${platform mgmt license product #2}         ${discount range}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}         ${discount range}[1]


Platform Mgmt. LATAM Direct - New Sales On-Prem License                                   
    [Tags]    C313398
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                            |   Prodcuct                                |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${LATAM direct account oppty}     ${platform mgmt license product #3}         ${discount range}[0]
    ${LATAM direct account oppty}     ${platform mgmt license product #3}         ${discount range}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}         ${discount range}[1]

