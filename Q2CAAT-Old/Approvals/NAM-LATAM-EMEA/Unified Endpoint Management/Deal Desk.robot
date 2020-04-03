*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range portfolio}                    60.01    100
@{discount range MDM}                          50.01    100
@{discount range KAAS}                         23.01    100
${uem kace portfolio license product 1}        BBA-KCE-CB-247-NBD    #DDB-SCL-PB    #, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace portfolio license product 2}        CBA-KCE-CB-247-NBD
${uem kace portfolio license product 3}        DTV-CAL-PB-OLA
${uem kace kaas license products}              JAC-KCE-TL
${uem kace cloud mdm}                          AAA-KCE-SAAS-247    #KKM-KCE-PB    
@{americas approvers}                          David Stepancich    #Spencer Hopps    David Grun    Brian Jones    Marco Fontenelle
@{emea approvers}                              David Stepancich    #Oliver Stairmand
&{amer mgr rule}	                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{americas approvers}
&{emea mgr rule}                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - UEM    approvers=@{emea approvers}
@{AMER leader approvers}                       Calvin Childs
&{AMER step 3 rule}                            chain=Direct New Sale Discount    rule=AMER EMEA UEM Sales Leader Approval    approvers=@{AMER leader approvers}
@{EMEA leader approvers}                       Calvin Childs
&{EMEA step 3 rule}                            chain=Direct New Sale Discount    rule=AMER EMEA UEM Sales Leader Approval   approvers=@{EMEA leader approvers}
@{AMER DealDesk approvers}                            Shannon Kekuna 
                                               ...    Joann King
                                               ...    Amber Rickman
&{AMER step 4 rule}                            chain=Direct New Sale Discount    rule=AMER DD Approval - Direct Discount    approvers=@{AMER DealDesk approvers}
@{AMER FieldOps approvers}                     Greg Molyneux
&{AMER FieldOps rule}                          chain=Direct New Sale Discount    rule=AMER Field Ops Director Approval - Direct Discount    approvers=@{AMER FieldOps approvers}
@{EMEA DealDesk approvers}                            Martina Kuecherer
                                               ...    Marie Wycherley
                                               ...    Marnie Caddle
&{EMEA step 4 rule}                            chain=Direct New Sale Discount    rule=EMEA DD Approval - Direct Discount   approvers=@{EMEA DealDesk approvers}


*** Test Cases ***
Unified Endpoint Management NAM Direct - New Sales On-Prem License - KACE - More than 60% Discount - APPROVER IS DEAL DESK
    [Tags]    C313456
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${NAM direct account oppty}        ${uem kace portfolio license product 3}        ${discount range portfolio}[0]	    ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license product 3}        ${discount range portfolio}	        ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license product 3}        ${discount range portfolio}[1]	    ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - KACE - More than 60% Discount-APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, DEAL DESK EMEA
    [Tags]    C313457
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${EMEA direct account oppty}       ${uem kace portfolio license product 1}        ${discount range portfolio}[0]	    ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}       ${uem kace portfolio license product 1}        ${discount range portfolio}	        ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}       ${uem kace portfolio license product 1}        ${discount range portfolio}[1]	    ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}

Unified Endpoint Management LATAM Direct- New Sales On-Prem License - KACE - More than 60% Discount - APPROVER IS DEAL DESK AMERICA
    [Tags]    C313458
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${LATAM direct account oppty}      ${uem kace portfolio license product 2}        ${discount range portfolio}[0]	    ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}      ${uem kace portfolio license product 2}        ${discount range portfolio}	        ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}      ${uem kace portfolio license product 2}        ${discount range portfolio}[1]	    ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}

Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - More than 23% Discount - Approval to be sent to Deal Desk along with Sales Manager/Country Manager/Director
    [Tags]    C632920
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------                             
    ${NAM direct account oppty}        ${uem kace kaas license products}              ${discount range KAAS}[0]            ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace kaas license products}              ${discount range KAAS}               ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace kaas license products}              ${discount range KAAS}[1]            ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE as a service (KaaS) (Minimum of 500 nodes) - More than 23% Discount - Approval to be sent to Deal Desk along with Sales Manager/Country Manager/Director
    [Tags]    C632928
    ${EMEA direct account oppty}       ${uem kace kaas license products}              ${discount range KAAS}[0]            ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}	   ${uem kace kaas license products}	          ${discount range KAAS}               ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}	   ${uem kace kaas license products}	          ${discount range KAAS}[1]            ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}


Unified Endpoint Management NAM Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) - More than 50% Discount - APPROVAL - Deal desk, Regional Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C632925
    ${NAM direct account oppty}        ${uem kace cloud mdm}                          ${discount range MDM}[0]             ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace cloud mdm}                          ${discount range MDM}                ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}        ${uem kace cloud mdm}                          ${discount range MDM}[1]             ${AMER step 3 rule}    ${amer mgr rule}    ${AMER step 4 rule}

Unified Endpoint Management EMEA Direct - New Sales On-Prem License - SaaS - KACE Cloud Mobile Device Manager (MDM) - More than 50% Discount - APPROVAL - Deal desk, Regional Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C632932
    ${EMEA direct account oppty}       ${uem kace cloud mdm}                          ${discount range MDM}[0]             ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}       ${uem kace cloud mdm}	                      ${discount range MDM}	               ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}       ${uem kace cloud mdm}                          ${discount range MDM}[1]             ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
            