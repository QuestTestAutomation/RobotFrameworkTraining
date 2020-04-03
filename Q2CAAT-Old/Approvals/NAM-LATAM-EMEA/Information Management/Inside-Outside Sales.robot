*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range}                 0    15
${inf mgmt license product}       DB2-TOD-PB



*** Test Cases ***

Information Mgmt. NAM Direct - New Sales On-Prem License                                  
    [Tags]    C313380
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}       ${inf mgmt license product}                      ${discount range}[0]   
    ${NAM direct account oppty}       ${inf mgmt license product}                      ${discount range}
    ${NAM direct account oppty}       ${inf mgmt license product}                      ${discount range}[1]


Information Mgmt. EMEA Direct- New Sales On-Prem License                                  
    [Tags]    C313381    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}      ${inf mgmt license product}                      ${discount range}[0]
    ${EMEA direct account oppty}      ${inf mgmt license product}                      ${discount range}
    ${EMEA direct account oppty}      ${inf mgmt license product}                      ${discount range}[1]


Information Mgmt. LATAM Direct - New Sales On-Prem License                                
    [Tags]    C313382
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}     ${inf mgmt license product}                      ${discount range}[0]
    ${LATAM direct account oppty}     ${inf mgmt license product}                      ${discount range}
    ${LATAM direct account oppty}     ${inf mgmt license product}                      ${discount range}[1]
