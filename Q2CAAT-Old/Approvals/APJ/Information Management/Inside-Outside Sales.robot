*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown
Test Template       Create Quote with No Approval Required    

*** Variables ***
@{discount range USD}                0    15
@{discount range SGD}                0    32
@{discount range KRW}                0    66
@{discount range CNY}                0    76
${inf mgmt license product #1}       DB2-TOD-PB
${inf mgmt license product #2}       TIL-QCO-PB-247 
${inf mgmt license product #3}       IAC-IMC-PB-NPN
${inf mgmt license product #4}       BDO-BMF-PB

*** Test Cases ***
 Information Mgmt. APJ Direct - New Sales On-Prem License
    [Tags]    C313383
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}[0]   
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}[1]
    
 
Information Management Product - Region APJ - Up to 76% (Chinese RMB) Approval not required
    [Tags]    C408756
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[0]
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[1]

Information Management Product - Region APJ - Up to 66% (Korea Won) Approval not required
    [Tags]    C408755
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[0]
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[1]

Information Management Product - Region APJ - Up to 32% (Singapore Dollars) Approval not required
    [Tags]    C408754
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[0]
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[1]