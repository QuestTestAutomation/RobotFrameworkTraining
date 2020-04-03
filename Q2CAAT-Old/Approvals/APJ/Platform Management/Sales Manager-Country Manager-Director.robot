*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range USD}                    15.01    30
@{discount range SGD}                    32.01    44
@{discount range KRW}                    66.01    72
@{discount range CNY}                    76.01    80   
${platform mgmt license product #1}      SCP-SV3-PB-SRP
${platform mgmt license product #2}      RCM-ATA-PB
${platform mgmt license product #3}      ACY-PAK-PB-SRP
${platform mgmt license product #4}      RCV-ATA-PB-5YR-247
@{apj pm mgr approvers}                  David Stepancich    #Boris Ivancic
&{apj pm mgr rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{apj pm mgr approvers}

*** Test Cases ***

Platform Management Product - Region APJ - Up to 80% (Chinese RMB) Sales Reps Manager
    [Tags]    C408776
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[0]        ${apj pm mgr rule}
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}           ${apj pm mgr rule}
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[1]        ${apj pm mgr rule}


Platform Management Product - Region APJ - Up to 72% (Korea Won) Sales Reps Manager
    [Tags]    C408775
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[0]        ${apj pm mgr rule}
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}           ${apj pm mgr rule}
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[1]        ${apj pm mgr rule}

Platform Management Product - Region APJ - Up to 44% (Singapore Dollars) Sales Reps Manager
    [Tags]    C408774
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[0]        ${apj pm mgr rule}
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}           ${apj pm mgr rule}
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[1]        ${apj pm mgr rule}

Platform Mgmt. APJ Direct - New Sales On-Prem License - More than 15% to 30% Discount- APPROVED BY Sales Manager /Country Manager / Director.                                     
    [Tags]    C313403    C408773    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[0]        ${apj pm mgr rule}
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}           ${apj pm mgr rule}
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[1]        ${apj pm mgr rule}
    


    
