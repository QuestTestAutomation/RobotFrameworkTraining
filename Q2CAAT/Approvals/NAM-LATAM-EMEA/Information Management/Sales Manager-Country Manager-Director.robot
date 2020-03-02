*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range}                 15.01    30
@{channel discount range}         00.01    9.99
${inf mgmt license product}       DB2-TOD-PB
${inf mgmt license product 2}     DPT-FOG-PB-247
@{im mgr rule approvers}          David Stepancich
&{im mgr rule}                    chain=Direct New Sale Discount    rule=Global Sales Manager Approval - IM            approvers=@{im mgr rule approvers}
&{channel im mgr rule}            chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - IM    approvers=@{im mgr rule approvers}


*** Test Cases ***
Information Mgmt. NAM Direct - New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313384
    ${NAM direct account oppty}       ${inf mgmt license product}	    ${discount range}[0]	        ${im mgr rule}
    ${NAM direct account oppty}       ${inf mgmt license product}	    ${discount range}               ${im mgr rule}
    ${NAM direct account oppty}       ${inf mgmt license product}	    ${discount range}[1]            ${im mgr rule}

Information Mgmt. EMEA Direct- New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313385
    ${EMEA direct account oppty}      ${inf mgmt license product}	    ${discount range}[0]            ${im mgr rule}
    ${EMEA direct account oppty}      ${inf mgmt license product}	    ${discount range}               ${im mgr rule}
    ${EMEA direct account oppty}      ${inf mgmt license product}	    ${discount range}[1]            ${im mgr rule}

Information Mgmt. LATAM Direct - New Sales On-Prem License - More than 15% to 30% Discount - APPROVED BY SALES REP MANAGER
    [Tags]    C313386
    ${LATAM direct account oppty}     ${inf mgmt license product}	    ${discount range}[0]            ${im mgr rule}
    ${LATAM direct account oppty}     ${inf mgmt license product}	    ${discount range}               ${im mgr rule}
    ${LATAM direct account oppty}     ${inf mgmt license product}	    ${discount range}[1]            ${im mgr rule}
    
Information Mgmt. LATAM Channel - New Sales On-Prem License - Up to 10% - APPROVED BY SALES REP MANAGER
    [Tags]    C313494
    ${LATAM channel account oppty}    ${inf mgmt license product 2}	    ${channel discount range}[0]	${channel im mgr rule}
    ${LATAM channel account oppty}    ${inf mgmt license product 2}	    ${channel discount range}	    ${channel im mgr rule}
    ${LATAM channel account oppty}    ${inf mgmt license product 2}	    ${channel discount range}[1]	${channel im mgr rule}    