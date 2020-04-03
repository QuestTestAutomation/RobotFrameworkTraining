*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                          30.01    55
@{channel discount range}                  10.01    20
${metalaogix license product #1}           SCC-MLX-PB-247
${metalaogix license product #2}           REX-MLX-PB-247 
${metalaogix license product #3}           CMS-MLX-PB-NPN
@{approvers}                               David Stepancich
&{step 2 rule}                             chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM                approvers=@{approvers}
&{channel step 2 rule}                     chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - PM	    approvers=@{approvers}
@{NAM leader approvers}                    Steve Harvey
&{NAM step 3 rule}                         chain=Direct New Sale Discount    rule=AMER PM Sales Leader Approval                     approvers=@{NAM leader approvers}
&{channel NAM step 3 rule}                 chain=Channel New Sale Discount   rule=AMER PM Sales Leader Approval - Channel Discount	approvers=@{NAM leader approvers}
@{EMEA leader approvers}                   Paul Virgili
&{EMEA step 3 rule}                        chain=Direct New Sale Discount    rule=EMEA PM Sales Leader Approval                     approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                chain=Channel New Sale Discount   rule=EMEA PM Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{LATAM leader approvers}                  Marco Fontenelle
&{LATAM step 3 rule}                       chain=Direct New Sale Discount    rule=LATAM PM Sales Leader Approval                    approvers=@{LATAM leader approvers}
&{channel LATAM step 3 rule}               chain=Channel New Sale Discount   rule=LATAM PM Sales Leader Approval - Channel Discount	approvers=@{LATAM leader approvers}


*** Test Cases ***
Platform mgmt Metalogix Products - Region NAM and LATAM - more than 30% to 55% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader
    [Tags]    C408736
    ${NAM direct account oppty}       ${metalaogix license product #3}	    ${discount range}[0]	        ${NAM step 3 rule}	       ${step 2 rule}
    ${EMEA direct account oppty}      ${metalaogix license product #1}	    ${discount range}	            ${EMEA step 3 rule}        ${step 2 rule}
    ${LATAM direct account oppty}     ${metalaogix license product #2}	    ${discount range}[1]	        ${LATAM step 3 rule}       ${step 2 rule}