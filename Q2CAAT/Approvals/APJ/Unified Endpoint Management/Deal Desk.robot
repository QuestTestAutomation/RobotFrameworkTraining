*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range USD portfolio}                60.01    100
@{discount range USD MDM}                      50.01    100
@{discount range USD KAAS}                     23.01    100
@{discount range SGD portfolio}                68.01    100
@{discount range SGD MDM}                      60.01    100
@{discount range SGD KAAS}                     38.01    100
@{discount range KRW portfolio}                84.01	100
@{discount range KRW MDM}                      80.01	100
@{discount range KRW KAAS}                     69.01	100
@{discount range CNY portfolio}                88.01	100
@{discount range CNY MDM}                      85.71    100 
@{discount range CNY KAAS}                     78.01	100   
${uem kace portfolio license product 1}        BBA-KCE-CB-247-NBD    #DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}        CBA-KCE-CB-247-NBD
${uem kace portfolio license product 3}        DTV-CAL-PB-OLA
${uem kace kaas license products}              JAC-KCE-TL
${uem kace cloud mdm}                          AAA-KCE-SAAS-247    #KKM-KCE-PB    
@{apj mgr approvers}	                       David Stepancich    #Boris Ivancic
&{apj mgr rule}	                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{apj mgr approvers}
@{APJ leader approvers}                        Boris Ivancic
&{APJ step 3 rule}                             chain=Direct New Sale Discount    rule=APJ UEM Sales Leader Approval    approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}                      Marie Wycherley
&{APJ DealDesk rule}                           chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount    approvers=@{APJ DealDesk approvers}
@{APJ FieldOps approvers}                      Greg Molyneux
&{APJ FieldOps rule}                           chain=Direct New Sale Discount    rule=APJ Field Ops Director Approval - Direct Discount    approvers=@{APJ FieldOps approvers}


*** Test Cases ***
Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - More than 23% Discount - Deal desk, Sales Manager/Country Manager/Director
    [Tags]    C632951
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${uem kace kaas license products}               ${discount range USD KAAS}[0]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace kaas license products}               ${discount range USD KAAS}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace kaas license products}               ${discount range USD KAAS}[1]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - More than 38% (Singapore Dollars) Disc - Deal desk, Sales Manager/Country Manager/Director
    [Tags]    C632954
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty SGD}       ${uem kace kaas license products}               ${discount range SGD KAAS}[0]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${uem kace kaas license products}               ${discount range SGD KAAS}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${uem kace kaas license products}               ${discount range SGD KAAS}[1]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - more than 69% discount (Korea Won) - Deal desk, Sales Manager/Country Manager/Director    
    [Tags]    C632957
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${uem kace kaas license products}               ${discount range KRW KAAS}[0]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace kaas license products}               ${discount range KRW KAAS}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace kaas license products}               ${discount range KRW KAAS}[1]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - Kace1000 as a service (Minimum of 500 nodes) - APJ Direct - New Sales On-Prem License - More than 78% discount (Chinese RMB) Dealdesk, Sales Manager/Country Manager/Director
    [Tags]    C632960
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${uem kace kaas license products}               ${discount range CNY KAAS}[0]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace kaas license products}               ${discount range CNY KAAS}	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace kaas license products}               ${discount range CNY KAAS}[1]	        ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management APJ Direct - New Sales On-Prem License - KACE - More than 60% Discount - Approval - Deal desk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C313455
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace portfolio license product 1}         ${discount range USD portfolio}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - KACE Portfolio - Region APJ - more than 84% (Korea Won) - Approval - Deal desk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C408799
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 1}         ${discount range KRW portfolio}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 2}         ${discount range KRW portfolio}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace portfolio license product 3}         ${discount range KRW portfolio}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - KACE Portfolio - Region APJ - more than 88% (Chinese RMB) - Approval - Deal desk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C408800
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${uem kace portfolio license product 3}        ${discount range CNY portfolio}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace portfolio license product 1}        ${discount range CNY portfolio}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace portfolio license product 2}        ${discount range CNY portfolio}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 50% Discount - Deal desk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632936
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}         ${discount range USD MDM}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}         ${discount range USD MDM}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}       ${uem kace cloud mdm}         ${discount range USD MDM}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS -KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 60% (Singapore Dollars) Disc -Dealdesk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632940
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}         ${discount range SGD MDM}[0]    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}	        ${discount range SGD MDM}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty SGD}       ${uem kace cloud mdm}	        ${discount range SGD MDM}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - more than 80% discount (Korea Won) - Deal desk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632944
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}[0]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}	    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty KRW}       ${uem kace cloud mdm}         ${discount range KRW MDM}[1]	${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}

Unified Endpoint Management - SaaS - KACE Cloud Mobile Device Manager (MDM) (Minimum of 25 nodes) APJ Direct - New Sales On-Prem License - More than 85.7% discount (Chinese RMB) Dealdesk, Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C632948
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}[0]    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}	   ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty CNY}       ${uem kace cloud mdm}        ${discount range CNY MDM}[1]    ${APJ step 3 rule}    ${apj mgr rule}    ${APJ FieldOps rule}
    