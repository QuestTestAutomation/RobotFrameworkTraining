*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                          30.01    60
@{channel discount range}                  10       19.99
${inf mgmt license product #1}             TDA-TOD-PB
${inf mgmt license product #2}             SPO-QCO-PB-247    #SNA-QCO-TB-247
${inf mgmt license product #3}             SPO-QCO-PB-247
@{approvers}                               David Stepancich
&{step 2 rule}                             chain=Direct New Sale Discount    rule=Global Sales Manager Approval - IM                approvers=@{approvers}
&{channel step 2 rule}                     chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - IM        approvers=@{approvers}
@{NAM leader approvers}                    Jon Hale
&{NAM step 3 rule}                         chain=Direct New Sale Discount    rule=AMER IM Sales Leader Approval                     approvers=@{NAM leader approvers}
&{channel NAM step 3 rule}                 chain=Channel New Sale Discount   rule=AMER IM Sales Leader Approval - Channel Discount	approvers=@{NAM leader approvers}
@{EMEA leader approvers}                   Manuel Nadal
&{EMEA step 3 rule}                        chain=Direct New Sale Discount    rule=EMEA IM Sales Leader Approval                     approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                chain=Channel New Sale Discount   rule=EMEA IM Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{LATAM leader approvers}                  Marco Fontenelle
&{LATAM step 3 rule}                       chain=Direct New Sale Discount    rule=LATAM IM Sales Leader Approval                    approvers=@{LATAM leader approvers}
&{channel LATAM step 3 rule}               chain=Channel New Sale Discount   rule=LATAM IM Sales Leader Approval - Channel Discount	approvers=@{LATAM leader approvers}


*** Test Cases ***
Information Mgmt. NAM Direct - New Sales On-Prem License - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313388
    ${NAM direct account oppty}       ${inf mgmt license product #1}	${discount range}[0]            ${NAM step 3 rule}	       ${step 2 rule}
    ${NAM direct account oppty}       ${inf mgmt license product #1}	${discount range}               ${NAM step 3 rule}         ${step 2 rule}
    ${NAM direct account oppty}       ${inf mgmt license product #1}	${discount range}[1]            ${NAM step 3 rule}         ${step 2 rule}

Information Mgmt. EMEA Direct - New Sales On-Prem License - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313389
    ${EMEA direct account oppty}      ${inf mgmt license product #2}	${discount range}[0]            ${EMEA step 3 rule}        ${step 2 rule}
    ${EMEA direct account oppty}      ${inf mgmt license product #2}	${discount range}               ${EMEA step 3 rule}        ${step 2 rule}
    ${EMEA direct account oppty}      ${inf mgmt license product #2}	${discount range}[1]            ${EMEA step 3 rule}        ${step 2 rule}

Information Mgmt. LATAM Direct - New Sales On-Prem License - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313390
    ${LATAM direct account oppty}     ${inf mgmt license product #3}	${discount range}[0]            ${LATAM step 3 rule}       ${step 2 rule}
    ${LATAM direct account oppty}     ${inf mgmt license product #3}	${discount range}               ${LATAM step 3 rule}       ${step 2 rule}
    ${LATAM direct account oppty}     ${inf mgmt license product #3}	${discount range}[1]            ${LATAM step 3 rule}       ${step 2 rule}
    
Information Mgmt. NAM Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313492
    ${NAM channel account oppty}      ${inf mgmt license product #2}	${channel discount range}[0]	${channel NAM step 3 rule}	${channel step 2 rule}
    ${NAM channel account oppty}      ${inf mgmt license product #2}	${channel discount range}       ${channel NAM step 3 rule}	${channel step 2 rule}
    ${NAM channel account oppty}      ${inf mgmt license product #2}	${channel discount range}[1]    ${channel NAM step 3 rule}	${channel step 2 rule}
    