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
${metalaogix license product #1}         EOS-MLX-PB-247    #AMF-MLX-TB-247
${metalaogix license product #2}         ZOQ-MLX-PB    #IMI-MLX-TB-247
@{apj mx dir approvers}                  David Stepancich    #Boris Ivancic
&{apj step 2 rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{apj mx dir approvers}
@{APJ leader approvers}                  Boris Ivancic
&{APJ step 3 rule}                       chain=Direct New Sale Discount    rule=APJ PM Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***
Platform mgmt Metalogix Products - Region APJ - up to 87% Discount (Chinese RMB) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${metalaogix license product #2}        ${discount range CNY}[0]        ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}        ${discount range CNY}           ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}        ${discount range CNY}[1]        ${APJ step 3 rule}    ${apj step 2 rule}


Platform mgmt Metalogix Products - Region APJ - up to 82% Discount (Korea Won) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}        ${discount range KRW}[0]        ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}        ${discount range KRW}           ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty KRW}        ${metalaogix license product #2}        ${discount range KRW}[1]        ${APJ step 3 rule}    ${apj step 2 rule}

Platform mgmt Metalogix Products - Region APJ - up to 64% Discount (Singapore Dollars) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty SGD}        ${metalaogix license product #2}        ${discount range SGD}[0]        ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty SGD}        ${metalaogix license product #1}        ${discount range SGD}           ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty SGD}        ${metalaogix license product #2}        ${discount range SGD}[1]        ${APJ step 3 rule}    ${apj step 2 rule}

Platform mgmt Metalogix Products - Region APJ - up to 55% - APPROVER IS Regional Business Unit Sales Leader                                    
    [Tags]    C408743    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${metalaogix license product #1}         ${discount range USD}[0]        ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #2}         ${discount range USD}           ${APJ step 3 rule}    ${apj step 2 rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #1}         ${discount range USD}[1]        ${APJ step 3 rule}    ${apj step 2 rule}
