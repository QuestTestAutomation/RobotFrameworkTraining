*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range}	                    15.01    30
@{channel discount range}	            00.01    9.99
${platform mgmt license product #1}	    SCP-SV3-PB-SRP
${platform mgmt license product #2}	    MEY-DMX-PB    #MEU-QDT-TB-247
${platform mgmt license product #3}	    SFA-SCL-PB-247
@{approvers}	                        David Stepancich
&{pm mgr rule}	                        chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM            approvers=@{approvers}
&{channel pm mgr rule}	                chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - PM    approvers=@{approvers}

*** Test Cases ***
Platform Mgmt. NAM Direct - New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313400
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[0]	        ${pm mgr rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}               ${pm mgr rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[1]            ${pm mgr rule}

Platform Mgmt. EMEA Direct - New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313401
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[0]            ${pm mgr rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}               ${pm mgr rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[1]            ${pm mgr rule}

Platform Mgmt. LATAM Direct - New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313402
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[0]            ${pm mgr rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}               ${pm mgr rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[1]            ${pm mgr rule}
    
Platform Mgmt. LATAM Channel - New Sales On-Prem License - Upto 20% - APPROVED BY SALES REP MANAGER
    [Tags]    C313498
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}[0]	${channel pm mgr rule}
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}	    ${channel pm mgr rule}
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}[1]	${channel pm mgr rule}    