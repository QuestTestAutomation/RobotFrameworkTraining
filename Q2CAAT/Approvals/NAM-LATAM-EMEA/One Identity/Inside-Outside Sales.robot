*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}                      0    15
${one identity license product #1}     ABH-VNT-PB-247
${one identity license product #2}     DMU-PGO-PB
${one identity license product #3}     EAV-DMZ-PB-247
${one identity license product #4}     CIA-AGV-TB


*** Test Cases ***
Identity and Security Mgmt. NAM Direct - New Sales On-Prem License - One Identity         
    [Tags]    C313476
 #------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                          |   Prodcuct                                 |  Discount Range        |
 #------------------------------------------------------------------------------------------------------------------------------------------------------        
    ${NAM direct account oppty}       ${one identity license product #1}         ${discount range}[0]        ${legal us-can rule}
    ${NAM direct account oppty}       ${one identity license product #1}         ${discount range}           ${legal us-can rule} 
    ${NAM direct account oppty}       ${one identity license product #1}         ${discount range}[1]        ${legal us-can rule}
    
    
Identity and Security Mgmt. EMEA - New Sales On-Prem License - One Identity               
    [Tags]    C313477 
 #---------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range          |
 #----------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}      ${one identity license product #2}         ${discount range}[0]        ${legal emea rule}
    ${EMEA direct account oppty}      ${one identity license product #2}         ${discount range}           ${legal emea rule}
    ${EMEA direct account oppty}      ${one identity license product #2}         ${discount range}[1]        ${legal emea rule}        
    
    
Identity and Security Mgmt. LATAM - New Sales On-Prem License - One Identity              
    [Tags]    C313478    
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `  |   Prodcuct                                |  Discount Range           |
 #------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}     ${one identity license product #3}         ${discount range}[0]        ${legal latam rule}
    ${LATAM direct account oppty}     ${one identity license product #3}         ${discount range}           ${legal latam rule}
    ${LATAM direct account oppty}     ${one identity license product #3}         ${discount range}[1]        ${legal latam rule}



