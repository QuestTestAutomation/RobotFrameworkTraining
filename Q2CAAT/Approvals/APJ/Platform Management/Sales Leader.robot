*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range USD}                    30.01    55
@{discount range SGD}                    44.01    64
@{discount range KRW}                    72.01    82
@{discount range CNY}                    80.01    87   
${platform mgmt license product #1}      SCP-SV3-PB-SRP
${platform mgmt license product #2}      RCM-ATA-PB
${platform mgmt license product #3}      EOG-MLX-PB-PRE
${platform mgmt license product #4}      ISA-ATA-PB
@{apj pm mgr approvers}                  David Stepancich    #Boris Ivancic
&{apj pm mgr rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{apj pm mgr approvers}
@{APJ leader approvers}                  Boris Ivancic
&{APJ step 3 rule}                       chain=Direct New Sale Discount    rule=APJ PM Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***
Platform Mgmt. APJ Direct - New Sales On-Prem License - More than 80% to 87% Discount (Chinese RMB) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408780
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[0]        ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}           ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty CNY}        ${platform mgmt license product #2}        ${discount range CNY}[1]        ${APJ step 3 rule}    ${apj pm mgr rule}


Platform Mgmt. APJ Direct - New Sales On-Prem License - More than 72% to 82% Discount (Korea Won) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408779
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[0]        ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}           ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty KRW}        ${platform mgmt license product #3}        ${discount range KRW}[1]        ${APJ step 3 rule}    ${apj pm mgr rule}

Platform Mgmt. APJ Direct - New Sales On-Prem License - More than 44% to 64% Discount (Singapore Dollars) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408778
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[0]        ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}           ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty SGD}        ${platform mgmt license product #4}        ${discount range SGD}[1]        ${APJ step 3 rule}    ${apj pm mgr rule}

Platform Mgmt. APJ Direct - New Sales On-Prem License - More than 30% to 55% Discount - APPROVER IS Regional Business Unit Sales Leader                                     
    [Tags]    C313407    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[0]        ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}           ${APJ step 3 rule}    ${apj pm mgr rule}
    ${APJ direct account oppty USD}        ${platform mgmt license product #1}         ${discount range USD}[1]        ${APJ step 3 rule}    ${apj pm mgr rule}
