*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                          30.01    55
@{channel discount range}                  10	    19.99
${platform mgmt license product #1}        SCP-SV3-PB-SRP
${platform mgmt license product #2}        MEY-DMX-PB    #MEU-QDT-TB-247
${platform mgmt license product #3}        SFA-SCL-PB-247
@{approvers}                               David Stepancich
&{step 2 rule}                             chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM                approvers=@{approvers}
&{channel step 2 rule}                     chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - PM	    approvers=@{approvers}
@{NAM leader approvers}                    Steve Harvey
&{NAM step 3 rule}                         chain=Direct New Sale Discount    rule=AMER PM Sales Leader Approval                      approvers=@{NAM leader approvers}
&{channel NAM step 3 rule}                 chain=Channel New Sale Discount   rule=AMER PM Sales Leader Approval - Channel Discount	approvers=@{NAM leader approvers}
@{EMEA leader approvers}                   Paul Virgili
&{EMEA step 3 rule}                        chain=Direct New Sale Discount    rule=EMEA PM Sales Leader Approval                     approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                chain=Channel New Sale Discount   rule=EMEA PM Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{LATAM leader approvers}                  Marco Fontenelle
&{LATAM step 3 rule}                       chain=Direct New Sale Discount    rule=LATAM PM Sales Leader Approval                    approvers=@{LATAM leader approvers}
&{channel LATAM step 3 rule}               chain=Channel New Sale Discount   rule=LATAM PM Sales Leader Approval - Channel Discount	approvers=@{LATAM leader approvers}


*** Test Cases ***
Platform Mgmt. NAM Direct - New Sales On-Prem License - More than 30% to 55% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313404
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[0]	        ${NAM step 3 rule}	       ${step 2 rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}	            ${NAM step 3 rule}         ${step 2 rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[1]	        ${NAM step 3 rule}         ${step 2 rule}

Platform Mgmt. EMEA Direct - New Sales On-Prem License - More than 30% to 55% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313405
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[0]	        ${EMEA step 3 rule}        ${step 2 rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}	            ${EMEA step 3 rule}        ${step 2 rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[1]	        ${EMEA step 3 rule}        ${step 2 rule}

Platform Mgmt. LATAM Direct - New Sales On-Prem License - More than 30% to 55% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313406
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[0]	        ${LATAM step 3 rule}       ${step 2 rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}	            ${LATAM step 3 rule}       ${step 2 rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[1]	        ${LATAM step 3 rule}       ${step 2 rule}
    
Platform Mgmt. NAM Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313496
    ${NAM channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}[0]    ${channel NAM step 3 rule}	${channel step 2 rule}
    ${NAM channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}       ${channel NAM step 3 rule}	${channel step 2 rule}
    ${NAM channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}[1]    ${channel NAM step 3 rule}	${channel step 2 rule}
    