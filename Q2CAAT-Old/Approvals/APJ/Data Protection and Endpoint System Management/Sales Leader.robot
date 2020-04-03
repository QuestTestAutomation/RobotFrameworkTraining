*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range USD}                          30.01    50
@{discount range USD 2}                        30.01    60
@{channel discount range 2}                    10.00    19.99
@{discount range SGD}                          44.01    60
@{discount range SGD 2}                        44.01    68
@{discount range KRW}                          72.01	80
@{discount range KRW 2}                        72.01	84
@{discount range CNY}                          80.01	85.7
@{discount range CNY 2}                        80.01	88    
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        LLD-KCE-PB-3YR    #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protectionl icense product}             VRB-VZC-TL 
@{apj mgr approvers}                           David Stepancich    #Boris Ivancic
&{apj mgr rule}                                chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP                approvers=@{apj mgr approvers}
&{channel apj mgr rule}                        chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP                approvers=@{apj mgr approvers}
@{APJ leader approvers}                        Boris Ivancic
&{APJ step 3 rule}                             chain=Direct New Sale Discount    rule=APJ DP Sales Leader Approval	                    approvers=@{APJ leader approvers}
&{channel APJ step 3 rule}                     chain=Channel New Sale Discount   rule=APJ DP Regional Sales Leader - Channel Discount	approvers=@{APJ leader approvers}


*** Test Cases ***

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 30% to 50% Discount - Approval should be sent to "Sales Manager/Country Manager/Director", "Regional Business Unit Sales Leader" 
    [Tags]    C313423
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - 30% to 50% Discount - Approval should sent to "Country Manager/Sales Manager/Director", "Regional Business Unit Sales Leader"
    [Tags]    C313439
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    
Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Approvals discount of 30% to 60% should be sent to "Regional Business Unit Sales Leader" along with "Country Manager/Sales Manager/Director"
    [Tags]    C313475
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD 2}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD 2}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD 2}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 44% to 60% Discount (Singapore Dollars) - Approval should be sent to "Sales Manager/Country Manager/Director", "Regional Business Unit Sales Leader" 
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection dl license product}            ${discount range SGD}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection dl license product}            ${discount range SGD}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection dl license product}            ${discount range SGD}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - 44% to 60% Discount (Singapore Dollars) - Approval should sent to "Country Manager/Sales Manager/Director", "Regional Business Unit Sales Leader"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection dr license product}            ${discount range SGD}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection dr license product}            ${discount range SGD}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection dr license product}            ${discount range SGD}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    
Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Approvals discount of 44% to 68% (Singapore Dollars) should be sent to "Regional Business Unit Sales Leader" along with "Country Manager/Sales Manager/Director"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}       ${discount range SGD 2}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}       ${discount range SGD 2}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${data protection rest dp license product}       ${discount range SGD 2}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 72% to 80% Discount (Korea Won) - Approval should be sent to "Sales Manager/Country Manager/Director", "Regional Business Unit Sales Leader" 
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection dl license product}            ${discount range KRW}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dl license product}            ${discount range KRW}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dl license product}            ${discount range KRW}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - 72% to 80% Discount (Korea Won) - Approval should sent to "Country Manager/Sales Manager/Director", "Regional Business Unit Sales Leader"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection dr license product}            ${discount range KRW}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}            ${discount range KRW}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}            ${discount range KRW}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    
Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Approvals discount of 72% to 84% (Korea Won) should be sent to "Regional Business Unit Sales Leader" along with "Country Manager/Sales Manager/Director"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}       ${discount range KRW 2}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}       ${discount range KRW 2}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection rest dp license product}       ${discount range KRW 2}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    
Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 80% to 85.7% Discount (Chinese RMB) - Approval should be sent to "Sales Manager/Country Manager/Director", "Regional Business Unit Sales Leader" 
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection dl license product}            ${discount range CNY}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection dl license product}            ${discount range CNY}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection dl license product}            ${discount range CNY}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - 80% to 85.7% Discount (Chinese RMB) - Approval should sent to "Country Manager/Sales Manager/Director", "Regional Business Unit Sales Leader"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection dr license product}            ${discount range CNY}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection dr license product}            ${discount range CNY}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection dr license product}            ${discount range CNY}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    
Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - Approvals discount of 80% to 88% (Chinese RMB) should be sent to "Regional Business Unit Sales Leader" along with "Country Manager/Sales Manager/Director"
    [Tags]    debug
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}       ${discount range CNY 2}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}       ${discount range CNY 2}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${data protection rest dp license product}       ${discount range CNY 2}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Data Protection APJ Channel Quote Discount - Incremental discounts of 10% to less than 20% - APPROVER IS Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C313503
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ channel account oppty USD}      ${data protection rest dp license product}       ${channel discount range 2}[0]    ${channel APJ step 3 rule}    ${channel apj mgr rule}
    ${APJ channel account oppty USD}      ${data protection rest dp license product}       ${channel discount range 2}       ${channel APJ step 3 rule}    ${channel apj mgr rule}
    ${APJ channel account oppty USD}      ${data protection rest dp license product}       ${channel discount range 2}[1]    ${channel APJ step 3 rule}    ${channel apj mgr rule}
    