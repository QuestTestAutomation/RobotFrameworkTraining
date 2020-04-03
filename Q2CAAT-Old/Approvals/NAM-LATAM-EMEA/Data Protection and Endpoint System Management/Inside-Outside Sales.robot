*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range}                              0    15
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        MMA-KCE-PB-3YR    #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protection dl addons}                   AAQ-APP-CB-247-4HR
${data protection dr addons}                   ABA-OCA-PB-3YR    #MDA-OCA-PB-3YR


*** Test Cases ***

Data Protection NAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP)     
    [Tags]    C313412    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[0]
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[1]
    
    
    
Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP)    
    [Tags]    C313413
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}[0]
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}[1]
    
    
    
Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL(SKUs with APP)    
    [Tags]    C313414
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}[0]
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}[1]
    

Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA)     
    [Tags]    C313428
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${NAM direct account oppty}       ${data protection dr license product}            ${discount range}[0]
    ${NAM direct account oppty}       ${data protection dr license product}            ${discount range}
    ${NAM direct account oppty}       ${data protection dr license product}            ${discount range}[1]
    
    
Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA)    
    [Tags]    C313429
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}      ${data protection dr license product}            ${discount range}[0]
    ${EMEA direct account oppty}      ${data protection dr license product}            ${discount range}
    ${EMEA direct account oppty}      ${data protection dr license product}            ${discount range}[1]
    
    
Data Protection LATAM Direct- New Sales On-Prem License - DR and MD DR (SKUs with OCA)    
    [Tags]    C313430    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}     ${data protection dr license product}            ${discount range}[0]
    ${LATAM direct account oppty}     ${data protection dr license product}            ${discount range}
    ${LATAM direct account oppty}     ${data protection dr license product}            ${discount range}[1]
 

Data Protection NAM Direct - New Sales On-Prem License - Rest of DP Products              
    [Tags]    C313460
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${NAM direct account oppty}       ${data protection rest dp license product}       ${discount range}[0]
    ${NAM direct account oppty}       ${data protection rest dp license product}       ${discount range}
    ${NAM direct account oppty}       ${data protection rest dp license product}       ${discount range}[1]
    
    
Data Protection EMEA Direct- New Sales On-Prem License - Rest of DP Products              
    [Tags]    C313461
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}      ${data protection rest dp license product}       ${discount range}[0]
    ${EMEA direct account oppty}      ${data protection rest dp license product}       ${discount range}
    ${EMEA direct account oppty}      ${data protection rest dp license product}       ${discount range}[1]
    
    
Data Protection LATAM Direct - New Sales On-Prem License - Rest of DP Products            
    [Tags]    C313462
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}     ${data protection rest dp license product}       ${discount range}[0]
    ${LATAM direct account oppty}     ${data protection rest dp license product}       ${discount range}
    ${LATAM direct account oppty}     ${data protection rest dp license product}       ${discount range}[1]

    
Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Add Ons NO APPROVAL REQUIRED
    [Tags]     C401719
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `    |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}     ${data protection dl addons}                     ${discount range}[0]
    ${LATAM direct account oppty}     ${data protection dl addons}                     ${discount range}
    ${LATAM direct account oppty}     ${data protection dl addons}                     ${discount range}[1]

Data Protection NAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Add Ons NO APPROVAL REQUIRED
    [Tags]     C401755
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `      |   Prodcuct                                      |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${data protection dl addons}                     ${discount range}[1]
    ${NAM direct account oppty}         ${data protection dl addons}                     ${discount range}
    ${NAM direct account oppty}         ${data protection dl addons}                     ${discount range}[0]
    
Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Add Ons 
    [Tags]    C401781
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `      |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------   
    ${EMEA direct account oppty}        ${data protection dl addons}                     ${discount range}[1]
    ${EMEA direct account oppty}        ${data protection dl addons}                     ${discount range}
    ${EMEA direct account oppty}        ${data protection dl addons}                     ${discount range}[0]   


Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Add Ons NO APPROVAL REQUIRED
    [Tags]    C401794
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `      |   Prodcuct                                      |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${NAM direct account oppty}         ${data protection dr addons}                     ${discount range}[0]
    ${NAM direct account oppty}         ${data protection dr addons}                     ${discount range}
    ${NAM direct account oppty}         ${data protection dr addons}                     ${discount range}[1]

Data Protection LATAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Add Ons NO APPROVAL REQUIRED
    [Tags]    C401816
    ${LATAM direct account oppty}       ${data protection dr addons}                    ${discount range}[0]
    ${LATAM direct account oppty}       ${data protection dr addons}                    ${discount range}
    ${LATAM direct account oppty}       ${data protection dr addons}                    ${discount range}[1]
    
Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Add Ons NO APPROVAL REQUIRED
    [Tags]    C401821
    ${EMEA direct account oppty}        ${data protection dr addons}                    ${discount range}[0]
    ${EMEA direct account oppty}        ${data protection dr addons}                    ${discount range}
    ${EMEA direct account oppty}        ${data protection dr addons}                    ${discount range}[1]
