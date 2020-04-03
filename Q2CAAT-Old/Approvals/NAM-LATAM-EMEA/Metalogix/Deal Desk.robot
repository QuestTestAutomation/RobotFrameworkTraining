*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range}                          55.01    100
@{channel discount range}                  20	    100
${metalaogix license product #1}           SCC-MLX-PB-247
${metalaogix license product #2}           REX-MLX-PB-247 
${metalaogix license product #3}           CMS-MLX-PB-NPN
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
Platform mgmt Metalogix Products - Region NAM and LATAM - More than 55% Discount-APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408737
    ${NAM direct account oppty}       ${metalaogix license product #2}	    ${discount range}[0]	        ${NAM step 3 rule}	            ${step 2 rule}	        ${AMER step 4 rule}
    ${EMEA direct account oppty}      ${metalaogix license product #3}	    ${discount range}	            ${EMEA step 3 rule}	            ${step 2 rule}	        ${EMEA step 4 rule}
    ${LATAM direct account oppty}     ${metalaogix license product #1}	    ${discount range}[1]	        ${LATAM step 3 rule}	        ${step 2 rule}	        ${AMER step 4 rule}
