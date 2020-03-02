*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown
Test Template       Create Quote with Sales Mgr Approval    

*** Variables ***
@{discount range USD}                15.01    30
@{discount range SGD}                32.01    44
@{discount range KRW}                66.01    72
@{discount range CNY}                76.01    80   
${inf mgmt license product #1}       DB2-TOD-PB
${inf mgmt license product #2}       AAT-FOG-TL 
${inf mgmt license product #3}       IAC-IMC-PB-NPN
${inf mgmt license product #4}       BDO-BMF-PB
@{apj mgr approvers}                 David Stepancich    #Boris Ivancic
&{apj mgr rule}                      chain=Direct New Sale Discount    rule=Global Sales Manager Approval - IM    approvers=@{apj mgr approvers}


*** Test Cases ***
 Information Mgmt. APJ Direct - New Sales On-Prem License - More than 15% to 30% Discount- APPROVED BY SALES REP MANAGER
    [Tags]    C313387    C408757
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}[0]        ${apj mgr rule} 
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}           ${apj mgr rule}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}       ${discount range USD}[1]        ${apj mgr rule}
    
 
Information Management Product - Region APJ - Up to 80% (Chinese RMB) Sales Reps Manager
    [Tags]    C408760
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty CNY}       ${inf mgmt license product #3}       ${discount range CNY}[0]        ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #3}       ${discount range CNY}           ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #3}       ${discount range CNY}[1]        ${apj mgr rule}

Information Management Product - Region APJ - Up to 72% (Korea Won) Sales Reps Manager
    [Tags]    C408759
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[0]        ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}           ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[1]        ${apj mgr rule}

Information Management Product - Region APJ - Up to 44% (Singapore Dollars) Sales Reps Manager
    [Tags]    C408758
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[0]        ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}           ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[1]        ${apj mgr rule}