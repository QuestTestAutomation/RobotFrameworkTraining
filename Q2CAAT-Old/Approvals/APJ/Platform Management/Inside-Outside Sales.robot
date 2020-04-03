*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{discount range USD}                    0    15
@{discount range SGD}                    0    32
@{discount range KRW}                    0    66
@{discount range CNY}                    0    76
${platform mgmt license product #1}      SCP-SV3-PB-SRP
${platform mgmt license product #2}      RCM-ATA-PB
${platform mgmt license product #3}      ACY-PAK-PB-SRP
${platform mgmt license product #4}      SEC-SCL-TB

*** Test Cases ***

Platform Management Product - Region APJ - Up to 76% (Chinese RMB) Approval not required
    [Tags]    C408772
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[0]
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[1]


Platform Management Product - Region APJ - Up to 66% (Korea Won) Approval not required
    [Tags]    C408771
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[0]
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[1]

Platform Management Product - Region APJ - Up to 32% (Singapore Dollars) Approval not required
    [Tags]    C408770
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[0]
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[1]

Platform Mgmt. APJ Direct - New Sales On-Prem License                                     
    [Tags]    C313399    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[0]
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[1]
    


    
