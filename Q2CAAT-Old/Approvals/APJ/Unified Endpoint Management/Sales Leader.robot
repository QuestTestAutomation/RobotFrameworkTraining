*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range USD portfolio}                30.01    60
@{discount range USD MDM}                      23.01    50
@{discount range SGD portfolio}                44.01    68
@{discount range SGD MDM}                      38.01    60
@{discount range KRW portfolio}                72.01	84
@{discount range KRW MDM}                      69.01	80
@{discount range CNY portfolio}                80.01	88
@{discount range CNY MDM}                      78.01	85.7    
${uem kace portfolio license product 1}        BBA-KCE-CB-247-NBD    #DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}        CBA-KCE-CB-247-NBD
${uem kace portfolio license product 3}        DTV-CAL-PB-OLA
${uem kace kaas license products}              JAC-KCE-TL
${uem kace cloud mdm}                          AAA-KCE-SAAS-247    #KKM-KCE-PB    
@{apj mgr approvers}	                       David Stepancich    #Boris Ivancic
&{apj mgr rule}	                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{apj mgr approvers}
@{APJ leader approvers}                        Boris Ivancic
&{APJ step 3 rule}                             chain=Direct New Sale Discount    rule=APJ UEM Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***

Unified Endpoint Management APJ Direct - New Sales On-Prem License - KACE - More Than 30% to 60% Discount - Approval should sent to "Country Manager/Sales Manager/Director ", "Regional Business Unit Sales Leader" 
    [Tags]    C313451
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint System Management Product - Region APJ - More than 72% to 84% (Korea Won) "Sales Manager/Country Manager/Director", "Regional Business Unit Sales Leader" 
    [Tags]    C408795
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}         ${discount range KRW portfolio}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}         ${discount range KRW portfolio}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}         ${discount range KRW portfolio}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - KACE Portfolio - Region APJ - More than 80% to 88% (Chinese RMB) Approver is Sales Manager/Country Manager/Director/Regional Business Unit Sales Leader
    [Tags]    C408796
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------  
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 3}        ${discount range CNY portfolio}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 3}        ${discount range CNY portfolio}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}        ${uem kace portfolio license product 3}        ${discount range CNY portfolio}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 23% to 50% Discount - Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632935
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}                           ${discount range USD MDM}[0]          ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}                           ${discount range USD MDM}             ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}                           ${discount range USD MDM}[1]          ${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - KACE Portfolio - Region APJ - Up to 68% (Singapore Dollars) Approvals should sent to Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C408794
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${uem kace portfolio license product 1}         ${discount range SGD portfolio}[0]	${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${uem kace portfolio license product 1}         ${discount range SGD portfolio}	    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${uem kace portfolio license product 1}         ${discount range SGD portfolio}[1]	${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 38% to 60% (Singapore Dollars) Disc - Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632939
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}         ${discount range SGD MDM}[0]	${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}         ${discount range SGD MDM}	    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}         ${discount range SGD MDM}[1]	${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - more than 69% to 80% discount (Korea Won) - Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632943
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}[1]    ${APJ step 3 rule}    ${apj mgr rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 78% to 85.7% discount (Chinese RMB) - Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632947
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}[0]    ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}       ${APJ step 3 rule}    ${apj mgr rule}
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}[1]    ${APJ step 3 rule}    ${apj mgr rule}
    