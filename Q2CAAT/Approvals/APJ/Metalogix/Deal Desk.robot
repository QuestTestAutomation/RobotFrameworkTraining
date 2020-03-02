*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range USD}                    55.01    100
@{discount range SGD}                    64.01    100
@{discount range KRW}                    82.01    100
@{discount range CNY}                    87.01    100   
${metalaogix license product #1}         EOS-MLX-PB-247    #AMF-MLX-TB-247
${metalaogix license product #2}         ZOQ-MLX-PB    #IMI-MLX-TB-247
@{apj mx dir approvers}                  David Stepancich    #Boris Ivancic
&{apj step 2 rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{apj mx dir approvers}
@{APJ leader approvers}                  Boris Ivancic
&{APJ step 3 rule}                       chain=Direct New Sale Discount    rule=APJ PM Sales Leader Approval    approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}                Marie Wycherley
&{APJ DealDesk rule}                     chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount    approvers=@{APJ DealDesk approvers}
@{APJ FieldOps approvers}                Greg Molyneux
&{APJ FieldOps rule}                     chain=Direct New Sale Discount    rule=APJ Field Ops Director Approval - Direct Discount    approvers=@{APJ FieldOps approvers}


*** Test Cases ***
Platform mgmt Metalogix Products - Region APJ - More than 55% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408744
    ${APJ direct account oppty USD}        ${metalaogix license product #2}         ${discount range USD}[0]        ${APJ step 3 rule}    ${apj step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #1}         ${discount range USD}           ${APJ step 3 rule}    ${apj step 2 rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}        ${metalaogix license product #1}         ${discount range USD}[1]        ${APJ step 3 rule}    ${apj step 2 rule}    ${APJ FieldOps rule}

 
Platform mgmt Metalogix Products - Region APJ - More than 87% (Chinese RMB) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty CNY}       ${platform mgmt license product #3}       ${discount range CNY}[0]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${platform mgmt license product #3}       ${discount range CNY}       ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${platform mgmt license product #3}       ${discount range CNY}[1]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}

Platform mgmt Metalogix Products - Region APJ - More than 82% (Korea Won) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty KRW}       ${platform mgmt license product #3}	    ${discount range KRW}[0]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${platform mgmt license product #3}	    ${discount range KRW}       ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${platform mgmt license product #3}	    ${discount range KRW}[1]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}

Platform mgmt Metalogix Products - Region APJ - More than 64% (Singapore Dollars) - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #-------------------------------------------------------------------------------------------------------------------------- 
    ${APJ direct account oppty SGD}       ${platform mgmt license product #1}        ${discount range SGD}[0]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${platform mgmt license product #1}        ${discount range SGD}       ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${platform mgmt license product #1}        ${discount range SGD}[1]    ${APJ step 3 rule}	   ${apj pm mgr rule}    ${APJ FieldOps rule}