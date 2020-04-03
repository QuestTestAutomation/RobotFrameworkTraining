*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range USD}                          15.01    30
@{discount range SGD}                          32.01    44
@{discount range KRW}                          66.01    72
@{discount range CNY}                          76.01    80    
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        LLD-KCE-PB-3YR    #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protectionl icense product}             VRB-VZC-TL 
@{apj mgr approvers}                           David Stepancich    #Boris Ivancic
&{apj mgr rule}                                chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP    approvers=@{apj mgr approvers}


*** Test Cases ***

Data Protection APJ Direct - New Sales On-Prem License - DL Series - More than 15% to 30% Discount - Approval should be sent to "Sales Manager/Country Manager/Director" 
    [Tags]    C313419
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[0]    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}       ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[1]    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - DR Series - More Than 15% to 30% Discount - "Country Manager/Sales Manager/Director"
    [Tags]    C313435
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[0]    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}       ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dr license product}            ${discount range USD}[1]    ${apj mgr rule}

Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products - More Than 15% to 30% Discount - "Country Manager/Sales Manager/Director"
    [Tags]    C313463
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}[0]    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}       ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection rest dp license product}       ${discount range USD}[1]    ${apj mgr rule}

Data Protection and Endpoint System Management - Region APJ - Up to 30% Sales Reps Manager
    [Tags]    C408789
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[0]    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}       ${apj mgr rule}
    ${APJ direct account oppty USD}       ${data protection dl license product}            ${discount range USD}[1]    ${apj mgr rule}

Data Protection and Endpoint System Management - Region APJ - Up to 44% (Singapore Dollars) Sales Reps Manager
    [Tags]    C408790
    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}[0]      ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}         ${apj mgr rule}
    ${APJ direct account oppty SGD}        ${data protection rest dp license product}    ${discount range SGD}[1]      ${apj mgr rule}

Data Protection and Endpoint System Management - Region APJ - Up to 72% (Korea Won) Sales Reps Manager
    [Tags]    C408791
    ${APJ direct account oppty KRW}        ${data protection dr license product}          ${discount range KRW}[0]     ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}        ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${data protection dr license product}           ${discount range KRW}[1]     ${apj mgr rule}

Data Protection and Endpoint System Management - Region APJ - Up to 80% (Chinese RMB) Sales Reps Manager
    [Tags]    C408792 
    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}[0]    ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}       ${apj mgr rule} 
    ${APJ direct account oppty CNY}        ${data protectionl icense product}              ${discount range CNY}[1]    ${apj mgr rule}
    