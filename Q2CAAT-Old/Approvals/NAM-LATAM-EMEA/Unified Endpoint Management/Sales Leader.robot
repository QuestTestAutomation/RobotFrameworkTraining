*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range portfolio}                    30.01    60
@{discount range MDM}                          23.01    50
${uem kace portfolio license product 1}        DDB-SCL-PB
${uem kace portfolio license product 2}        ABA-KCE-CB-247-NBD-5YR
${uem kace portfolio license product 3}        BBA-KCE-CB-247-NBD
${uem kace portfolio license product 4}        RAB-RSC-PB
${uem kace kaas license product 1}             JIE-KCE-TB
${uem kace cloud mdm}                          AAA-KCE-SAAS-247    #no products found in tst          
@{americas approvers}                          David Stepancich    #Spencer Hopps    David Grun    Brian Jones    Marco Fontenelle
@{emea approvers}                              David Stepancich    #Oliver Stairmand
&{amer mgr rule}	                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{americas approvers}
&{emea mgr rule}                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{emea approvers}
@{AMER leader approvers}                       Calvin Childs
&{AMER step 3 rule}                            chain=Direct New Sale Discount    rule=AMER EMEA UEM Sales Leader Approval    approvers=@{AMER leader approvers}
@{EMEA leader approvers}                       Calvin Childs
&{EMEA step 3 rule}                            chain=Direct New Sale Discount    rule=AMER EMEA UEM Sales Leader Approval   approvers=@{EMEA leader approvers}


*** Test Cases ***
Unified Endpoint Management NAM Direct - New Sales On-Prem License - KACE - More than 30% to 60% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader 
    [Tags]    C313452
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}         ${discount range portfolio}[0]    ${AMER step 3 rule}    ${amer mgr rule}
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}         ${discount range portfolio}       ${AMER step 3 rule}    ${amer mgr rule}
    ${NAM direct account oppty}       ${uem kace portfolio license product 1}         ${discount range portfolio}[1]    ${AMER step 3 rule}    ${amer mgr rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - KACE - More than 30% to 60% Discount -APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C313453
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}         ${discount range portfolio}[0]    ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}         ${discount range portfolio}       ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace portfolio license product 2}         ${discount range portfolio}[1]    ${EMEA step 3 rule}    ${emea mgr rule}

Unified Endpoint Management LATAM Direct - New Sales On-Prem License - KACE - More than 30% to 60% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C313454
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}         ${discount range portfolio}[0]    ${AMER step 3 rule}    ${amer mgr rule}
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}         ${discount range portfolio}       ${AMER step 3 rule}    ${amer mgr rule}
    ${LATAM direct account oppty}     ${uem kace portfolio license product 3}         ${discount range portfolio}[1]    ${AMER step 3 rule}    ${amer mgr rule}

Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS KACE Cloud Mobile Device Manager(MDM) - More than 23% to 50% Discount - APPROVAL Regional Sales Manager/Country Manager/Director and Regional Business Unit Sales Leader
    [Tags]    C632923
    ${NAM direct account oppty}       ${uem kace cloud mdm}         ${discount range MDM}[0]    ${AMER step 3 rule}    ${amer mgr rule}
    ${NAM direct account oppty}       ${uem kace cloud mdm}         ${discount range MDM}       ${AMER step 3 rule}    ${amer mgr rule}
    ${NAM direct account oppty}       ${uem kace cloud mdm}         ${discount range MDM}[1]    ${AMER step 3 rule}    ${amer mgr rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS KACE Cloud Mobile Device Manager(MDM) - More than 23% to 50% Discount - APPROVAL - Sales Manager/Country Manager/Director and Regional Business Unit Sales Leader
    [Tags]    C632931
    ${EMEA direct account oppty}      ${uem kace cloud mdm}         ${discount range MDM}[0]    ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace cloud mdm}         ${discount range MDM}       ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${uem kace cloud mdm}         ${discount range MDM}[1]    ${EMEA step 3 rule}    ${emea mgr rule}
        