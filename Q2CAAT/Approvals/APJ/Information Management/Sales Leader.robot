*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range USD}                30.01    60
@{discount range SGD}                44.01    68
@{discount range KRW}                72.01    84
@{discount range CNY}                80.01    88
@{channel discount range}            10       19.99 
${inf mgmt license product #1}       VIR-BMF-PB
${inf mgmt license product #2}       TIL-QCO-PB-247 
${inf mgmt license product #3}       DPT-FOG-PB-247
${inf mgmt license product #4}       DZB-TOD-PB
@{apj mgr approvers}                 David Stepancich
&{step 2 rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - IM	                approvers=@{apj mgr approvers}
&{channel step 2 rule}               chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - IM	        approvers=@{apj mgr approvers}
@{APJ leader approvers}              Boris Ivancic
&{APJ step 3 rule}                   chain=Direct New Sale Discount    rule=APJ IM Sales Leader Approval	                    approvers=@{APJ leader approvers}
&{channel APJ step 3 rule}           chain=Channel New Sale Discount   rule=APJ IM Regional Sales Leader - Channel Discount	    approvers=@{APJ leader approvers}


*** Test Cases ***
Information Mgmt. APJ Direct - New Sales On-Prem License - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313391
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}[0]    ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}       ${APJ step 3 rule}     ${step 2 rule}
    ${APJ direct account oppty USD}       ${inf mgmt license product #1}            ${discount range USD}[1]    ${APJ step 3 rule}     ${step 2 rule}

 
Information Management Product - Region APJ - Up to 88% (Chinese RMB) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408764
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[0]    ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}       ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty CNY}       ${inf mgmt license product #4}       ${discount range CNY}[1]    ${APJ step 3 rule}	   ${step 2 rule}

Information Management Product - Region APJ - Up to 84% (Korea Won) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408763
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty KRW}       ${inf mgmt license product #1}      ${discount range KRW}[0]    ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #1}      ${discount range KRW}       ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty KRW}       ${inf mgmt license product #1}      ${discount range KRW}[1]    ${APJ step 3 rule}	   ${step 2 rule}

Information Management Product - Region APJ - Up to 68% (Singapore Dollars) - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C408762
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}      ${discount range SGD}[0]    ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}      ${discount range SGD}       ${APJ step 3 rule}	   ${step 2 rule}
    ${APJ direct account oppty SGD}       ${inf mgmt license product #2}      ${discount range SGD}[1]    ${APJ step 3 rule}	   ${step 2 rule}
    
Information Mgmt. APJ Channel Quote Discount - Incremental discounts of 10% to less than 20% - APPROVER IS Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C313495
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ channel account oppty USD}      ${inf mgmt license product #3}      ${channel discount range}[0]    ${channel APJ step 3 rule}	${channel step 2 rule}
    ${APJ channel account oppty USD}      ${inf mgmt license product #3}      ${channel discount range}       ${channel APJ step 3 rule}	${channel step 2 rule}
    ${APJ channel account oppty USD}      ${inf mgmt license product #3}      ${channel discount range}[1]    ${channel APJ step 3 rule}	${channel step 2 rule}
    