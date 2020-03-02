*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range USD}                          0    15
@{discount range SGD}                          0    32
@{discount range KRW}                          0    66
@{discount range CNY}                          0    76
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        LLD-KCE-PB-3YR    #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protectionl icense product}             VRB-VZC-TL    


*** Test Cases ***

Data Protection APJ - Direct New Sales On-Prem License - DL Series
    [Tags]    C313415
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[0]
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[1]
    
Data Protection APJ Direct - New Sales On-Prem License - DR Series
    [Tags]    C313431    
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `|   Prodcuct                                     |  discount range USD
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[0]
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[1]
    
Data Protection APJ Direct - New Sales On-Prem License - KACE 
    [Tags]    C313443
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `|   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                            
    ${APJ direct account oppty USD}       ${data protection kace license product}          ${discount range USD}[0]
    ${APJ direct account oppty USD}       ${data protection kace license product}          ${discount range USD}
    ${APJ direct account oppty USD}       ${data protection kace license product}          ${discount range USD}[1]
    
Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products              
    [Tags]    C313459 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `|   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------      
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}[0]
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}[1]

#Data Protection and Endpoint System Management - Region APJ - Up to 76% (Chinese RMB)
#    [Tags]    C408788
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------  
#    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}[0]
#    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}  
#    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}[1]

#Data Protection and Endpoint System Management - Region APJ - Up to 66% (Korea Won) Approval not required
#    [Tags]    C408787
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------  
#     ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}[0]
#     ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}
#     ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}[1]

#Data Protection and Endpoint System Management - Region APJ - Up to 32% (Singapore Dollars) Approval not required
#    [Tags]    C408786
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
#    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}[0]
#    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}
#    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}[1]
    
