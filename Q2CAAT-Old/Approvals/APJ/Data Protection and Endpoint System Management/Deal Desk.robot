*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range USD}                          50.01    100
@{discount range USD 2}                        60.01    100
@{discount range SGD}                          60.01    100
@{discount range SGD rest}                     68.01    100
@{discount range KRW}                          80.01    100
@{discount range KRW rest}                     84.01    100
@{discount range CNY}                          85.71    100
@{discount range CNY rest}                     88.01    100   
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        LLD-KCE-PB-3YR    #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protectionl icense product}             VRB-VZC-TL 
@{apj mgr approvers}                           David Stepancich    #Boris Ivancic
&{apj mgr rule}                                chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP    approvers=@{apj mgr approvers}
@{APJ leader approvers}                        Boris Ivancic
&{APJ step 3 rule}                             chain=Direct New Sale Discount    rule=APJ DP Sales Leader Approval    approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}                      Marie Wycherley
&{APJ DealDesk rule}                           chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount    approvers=@{APJ DealDesk approvers}
@{APJ FieldOps approvers}                      Greg Molyneux
&{APJ FieldOps rule}                           chain=Direct New Sale Discount    rule=APJ DP Field Ops Director Approval - Direct Discount    approvers=@{APJ FieldOps approvers}


*** Test Cases ***
Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 50% Discount - Approval should sent to "Country Manager/Sales Manager/Director ", "Regional Business Unit Sales Leader", "Deal Desk"
    [Tags]    C313427
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dl license product}           ${discount range USD}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}           ${discount range USD}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}           ${discount range USD}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - More than 50% Discount - Deal Desk (or Field Ops Director in APJ), Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C317386
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dr license product}           ${discount range USD}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}           ${discount range USD}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}           ${discount range USD}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Over 60% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, DEAL DESK
    [Tags]    C317387
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection rest dp license product}      ${discount range USD 2}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}      ${discount range USD 2}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}      ${discount range USD 2}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 60% Discount (Singapore Dollars) - Approval should sent to "Country Manager/Sales Manager/Director ", "Regional Business Unit Sales Leader", "Deal Desk"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection dl license product}           ${discount range SGD}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection dl license product}           ${discount range SGD}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection dl license product}           ${discount range SGD}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - More than 60% Discount (Singapore Dollars) - Deal Desk (or Field Ops Director in APJ), Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection dr license product}           ${discount range SGD}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection dr license product}           ${discount range SGD}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection dr license product}           ${discount range SGD}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Over 68% Discount (Singapore Dollars) - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, DEAL DESK
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}      ${discount range SGD rest}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}	  ${discount range SGD rest}	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}	  ${discount range SGD rest}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 80% Discount (Korea Won) - Approval should sent to "Country Manager/Sales Manager/Director ", "Regional Business Unit Sales Leader", "Deal Desk"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection dl license product}           ${discount range KRW}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection dl license product}           ${discount range KRW}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection dl license product}           ${discount range KRW}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - More than 80% Discount (Korea Won) - Deal Desk (or Field Ops Director in APJ), Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Over 84% Discount (Korea Won) - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, DEAL DESK
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}      ${discount range KRW rest}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}	  ${discount range KRW rest}	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}	  ${discount range KRW rest}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 85.7% Discount (Chinese RMB) - Approval should sent to "Country Manager/Sales Manager/Director ", "Regional Business Unit Sales Leader", "Deal Desk"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection dl license product}           ${discount range CNY}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection dl license product}           ${discount range CNY}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection dl license product}           ${discount range CNY}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - More than 85.7% Discount (Chinese RMB) - Deal Desk (or Field Ops Director in APJ), Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection dr license product}           ${discount range CNY}[0]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection dr license product}           ${discount range CNY}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection dr license product}           ${discount range CNY}[1]	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Over 88% Discount (Chinese RMB) - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, DEAL DESK
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}      ${discount range CNY rest}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}	  ${discount range CNY rest}	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}	  ${discount range CNY rest}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
        