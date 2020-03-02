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
${metalaogix license product #1}         CPO-MLX-PB    #AMF-MLX-TB-247
${metalaogix license product #2}         IMI-MLX-TB-247                


*** Test Cases ***

Platform mgmt Metalogix Products - Region APJ - up to 10% NO APPROVAL REQUIRED
    [Tags]    C408741 
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${metalaogix license product #1}                 ${discount range USD}[0]
    ${APJ direct account oppty USD}        ${metalaogix license product #2}                 ${discount range USD}
    ${APJ direct account oppty USD}        ${metalaogix license product #1}                 ${discount range USD}[1]

 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty SGD}        ${metalaogix license product #1}                 ${discount range SGD}[0]
    ${APJ direct account oppty SGD}        ${metalaogix license product #2}                 ${discount range SGD}
    ${APJ direct account oppty SGD}        ${metalaogix license product #1}                 ${discount range SGD}[1]
 
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}                 ${discount range KRW}[0]
    ${APJ direct account oppty KRW}        ${metalaogix license product #2}                 ${discount range KRW}
    ${APJ direct account oppty KRW}        ${metalaogix license product #1}                 ${discount range KRW}[1]
    
 
#--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                                   |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}                 ${discount range CNY}[0]
    ${APJ direct account oppty CNY}        ${metalaogix license product #2}                 ${discount range CNY}
    ${APJ direct account oppty CNY}        ${metalaogix license product #1}                 ${discount range CNY}[1]

