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
${metalaogix license product #1}         EOS-MLX-PB-247    #AMF-MLX-TB-247
${metalaogix license product #2}         ZOQ-MLX-PB    #IMI-MLX-TB-247
@{apj mx dir approvers}                  David Stepancich    #Boris Ivancic
#&{apj mx dir rule}                       chain=Direct New Sale Discount    rule=APJ MLX Director/VP Approval - Direct Discount    approvers=@{apj mx dir approvers}                
&{apj mx dir rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{apj mx dir approvers}


*** Test Cases ***

Platform mgmt Metalogix Products - Region APJ - up to 30% SALES REP MANAGER
    [Tags]    C408742 
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${metalaogix license product #1}                 ${discount range USD}[0]        ${apj mx dir rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #2}                 ${discount range USD}           ${apj mx dir rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #1}                 ${discount range USD}[1]        ${apj mx dir rule}
    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty SGD}        ${metalaogix license product #1}                 ${discount range SGD}[0]        ${apj mx dir rule}
    ${APJ direct account oppty SGD}        ${metalaogix license product #2}                 ${discount range SGD}           ${apj mx dir rule}
    ${APJ direct account oppty SGD}        ${metalaogix license product #1}                 ${discount range SGD}[1]        ${apj mx dir rule}
    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}                 ${discount range KRW}[0]        ${apj mx dir rule}
    ${APJ direct account oppty KRW}        ${metalaogix license product #2}                 ${discount range KRW}           ${apj mx dir rule}
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}                 ${discount range KRW}[1]        ${apj mx dir rule}
    
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}                 ${discount range CNY}[0]        ${apj mx dir rule}
    ${APJ direct account oppty CNY}        ${metalaogix license product #2}                 ${discount range CNY}           ${apj mx dir rule}
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}                 ${discount range CNY}[1]        ${apj mx dir rule}

