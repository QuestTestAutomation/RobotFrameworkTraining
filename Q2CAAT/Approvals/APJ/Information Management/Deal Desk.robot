*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range USD}                60.01    100
@{discount range SGD}                68.01    100
@{discount range KRW}                84.01    100
@{discount range CNY}                88.01    100   
${inf mgmt license product #1}       SRM-SPO-PB
${inf mgmt license product #2}       LNI-IMC-PB 
${inf mgmt license product #3}       SUS-SPO-PB
${inf mgmt license product #4}       TOX-LEC-PB    #SMA-QCO-TB
@{apj mgr approvers}                 David Stepancich
&{step 2 rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - IM    approvers=@{apj mgr approvers}
@{APJ leader approvers}              Boris Ivancic
&{APJ step 3 rule}                   chain=Direct New Sale Discount    rule=APJ IM Sales Leader Approval    approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}            Marie Wycherley
&{APJ DealDesk rule}                 chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount    approvers=@{APJ DealDesk approvers}
@{APJ FieldOps approvers}            Greg Molyneux
&{APJ FieldOps rule}                 chain=Direct New Sale Discount    rule=APJ Field Ops Director Approval - Direct Discount    approvers=@{APJ FieldOps approvers}


*** Test Cases ***
Information Mgmt. APJ Direct - New Sales On-Prem License - More than 60% Discount - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313395
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}[0]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}       ${APJ step 3 rule}     ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}[1]    ${APJ step 3 rule}     ${step 2 rule}    ${APJ FieldOps rule}

 
Information Mgmt. APJ Direct - New Sales On-Prem License - More than 88% (Chinese RMB) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408768
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[0]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}       ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[1]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}

Information Mgmt. APJ Direct - New Sales On-Prem License - More than 84% (Korea Won) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408767
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[0]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}       ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #3}      ${discount range KRW}[1]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}

Information Mgmt. APJ Direct - New Sales On-Prem License - More than 68% (Singapore Dollars) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408766
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[0]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}       ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}        ${discount range SGD}[1]    ${APJ step 3 rule}	   ${step 2 rule}    ${APJ FieldOps rule}