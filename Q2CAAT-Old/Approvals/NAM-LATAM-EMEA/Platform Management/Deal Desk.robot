*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range}                          55.01    100
@{channel discount range}                  20	    100
${platform mgmt license product #1}        SFM-SCL-PB-2YR
${platform mgmt license product #2}        SEC-SCL-TB
${platform mgmt license product #3}        KPC-ATA-PB
@{approvers}                               David Stepancich
&{step 2 rule}                             chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM	            approvers=@{approvers}
&{channel step 2 rule}                     chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - PM        approvers=@{approvers}
@{NAM leader approvers}                    Steve Harvey
&{NAM step 3 rule}                         chain=Direct New Sale Discount    rule=AMER PM Sales Leader Approval	                    approvers=@{NAM leader approvers}
&{channel NAM step 3 rule}                 chain=Channel New Sale Discount   rule=AMER PM Sales Leader Approval - Channel Discount	approvers=@{NAM leader approvers}
@{EMEA leader approvers}                   Paul Virgili
&{EMEA step 3 rule}                        chain=Direct New Sale Discount    rule=EMEA PM Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                chain=Channel New Sale Discount   rule=EMEA PM Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{LATAM leader approvers}                  Marco Fontenelle
&{LATAM step 3 rule}                       chain=Direct New Sale Discount    rule=LATAM PM Sales Leader Approval	                approvers=@{LATAM leader approvers}
&{channel LATAM step 3 rule}               chain=Channel New Sale Discount   rule=LATAM PM Sales Leader Approval - Channel Sales	approvers=@{LATAM leader approvers}
@{AMER DealDesk approvers}                        Shannon Kekuna
                                           ...    Joann King
                                           ...    Amber Rickman
&{AMER step 4 rule}                        chain=Direct New Sale Discount    rule=AMER DD Approval - Direct Discount	            approvers=@{AMER DealDesk approvers}
&{channel AMER step 4 rule}                chain=Channel New Sale Discount   rule=AMER DD Approval - Channel Discount	            approvers=@{AMER DealDesk approvers}
@{EMEA DealDesk approvers}                        Martina Kuecherer
                                           ...    Marie Wycherley
                                           ...    Marnie Caddle
&{EMEA step 4 rule}                        chain=Direct New Sale Discount    rule=EMEA DD Approval - Direct Discount	            approvers=@{EMEA DealDesk approvers}
&{channel EMEA step 4 rule}                chain=Channel New Sale Discount   rule=EMEA DD Approval - Channel Discount	            approvers=@{EMEA DealDesk approvers}

*** Test Cases ***
Platform Mgmt. NAM Direct - New Sales On-Prem License - More than 55% Discount - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313408
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[0]	        ${NAM step 3 rule}	            ${step 2 rule}	        ${AMER step 4 rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}	            ${NAM step 3 rule}	            ${step 2 rule}	        ${AMER step 4 rule}
    ${NAM direct account oppty}       ${platform mgmt license product #1}	    ${discount range}[1]	        ${NAM step 3 rule}	            ${step 2 rule}	        ${AMER step 4 rule}

Platform Mgmt. EMEA Direct - New Sales On-Prem License - More than 55% Discount - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313409
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[0]	        ${EMEA step 3 rule}	            ${step 2 rule}	        ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}	            ${EMEA step 3 rule}	            ${step 2 rule}	        ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${platform mgmt license product #2}	    ${discount range}[1]	        ${EMEA step 3 rule}	            ${step 2 rule}	        ${EMEA step 4 rule}

Platform Mgmt. LATAM Direct - New Sales On-Prem License - More than 55% Discount - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313410
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[0]	        ${LATAM step 3 rule}	        ${step 2 rule}	        ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}	            ${LATAM step 3 rule}	        ${step 2 rule}	        ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${platform mgmt license product #3}	    ${discount range}[1]	        ${LATAM step 3 rule}	        ${step 2 rule}	        ${AMER step 4 rule}

Platform Mgmt. NAM Channel Quote Discount - Incremental discounts of 20% or greater - APPROVER IS DEAL DESK along with Sales Manager/Country Manager and Regional Business Unit Sales Leader
    [Tags]    C313552
    ${NAM channel account oppty}       ${platform mgmt license product #3}	    ${channel discount range}[0]	${channel NAM step 3 rule}	    ${channel step 2 rule}	${channel AMER step 4 rule}
    ${NAM channel account oppty}       ${platform mgmt license product #3}	    ${channel discount range}	    ${channel NAM step 3 rule}	    ${channel step 2 rule}	${channel AMER step 4 rule}
    ${NAM channel account oppty}       ${platform mgmt license product #3}	    ${channel discount range}[1]	${channel NAM step 3 rule}	    ${channel step 2 rule}	${channel AMER step 4 rule}
        
Platform Mgmt. EMEA Channel - New Sales On-Prem License - Incremental discounts from 20% & greater - APPROVER IS Sales Manager /Country Manager / Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313497
    ${EMEA channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}[0]    ${channel EMEA step 3 rule}	    ${channel step 2 rule}	${channel EMEA step 4 rule}
    ${EMEA channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}       ${channel EMEA step 3 rule}	    ${channel step 2 rule}	${channel EMEA step 4 rule}
    ${EMEA channel account oppty}      ${platform mgmt license product #2}	    ${channel discount range}[1]    ${channel EMEA step 3 rule}	    ${channel step 2 rule}	${channel EMEA step 4 rule}

Platform Mgmt. LATAM Channel Quote Discount - More than 20% - APPROVER IS DEAL DESK
    [Tags]    C313554
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}[0]	${channel LATAM step 3 rule}	${channel step 2 rule}	${channel AMER step 4 rule}
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}	    ${channel LATAM step 3 rule}	${channel step 2 rule}	${channel AMER step 4 rule}
    ${LATAM channel account oppty}     ${platform mgmt license product #1}	    ${channel discount range}[1]	${channel LATAM step 3 rule}	${channel step 2 rule}	${channel AMER step 4 rule}
        