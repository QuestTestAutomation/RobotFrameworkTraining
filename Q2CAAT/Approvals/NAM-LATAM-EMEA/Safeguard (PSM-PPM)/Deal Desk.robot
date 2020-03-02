*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range}                      30.01    99.99
@{channel discount range}              20	    100
${oid safeguard license product}       SPO-SFG-PB-247
${oid safeguard license product 2}     BZC-TS4-PB-247
${oid safeguard license product 3}     SPS-SFG-PB-247    #DAY-BAL-PB-247
${productQuantity 3}                   700000
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	            approvers=@{director approvers}
&{channel director rule}               chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - OI	    approvers=@{director approvers}
@{AMER leader approvers}               Edwin Bowman
&{AMER leader rule}                    chain=Direct New Sale Discount    rule=AMER OI Sales Leader Approval	                    approvers=@{AMER leader approvers}
&{channel AMER leader rule}            chain=Channel New Sale Discount   rule=AMER OI Sales Leader Approval - Channel Discount	approvers=@{AMER leader approvers}
@{EMEA leader approvers}               Ian Sutherland
&{EMEA leader rule}                    chain=Direct New Sale Discount    rule=EMEA OI Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA leader rule}            chain=Channel New Sale Discount  rule=EMEA OI Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{AMER DealDesk approvers}                    Shannon Kekuna
                                       ...    Joann King
                                       ...    Amber Rickman
&{AMER step 4 rule}                    chain=Direct New Sale Discount    rule=AMER DD Approval - Direct Discount	            approvers=@{AMER DealDesk approvers}
&{channel AMER step 4 rule}            chain=Channel New Sale Discount   rule=AMER DD Approval - Channel Discount	            approvers=@{AMER DealDesk approvers}
@{EMEA DealDesk approvers}                    Martina Kuecherer
                                       ...    Marie Wycherley
                                       ...    Marnie Caddle
&{EMEA step 4 rule}                    chain=Direct New Sale Discount    rule=EMEA DD Approval - Direct Discount	            approvers=@{EMEA DealDesk approvers}
&{channel EMEA step 4 rule}            chain=Channel New Sale Discount   rule=EMEA DD Approval - Channel Discount	            approvers=@{EMEA DealDesk approvers}

*** Test Cases ***
One identity Safe guard Products - Region NAM and LATAM - over 30% discount should be sent Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408729
    ${NAM direct account oppty}       ${oid safeguard license product 3}            ${discount range}[0]        ${legal us-can rule}    ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}    ${productQuantity 3}        
    ${EMEA direct account oppty}      ${oid safeguard license product 3}            ${discount range}           ${legal emea rule}	    ${EMEA leader rule}    ${director rule}    ${EMEA step 4 rule}    ${productQuantity 3}
    ${LATAM direct account oppty}     ${oid safeguard license product 3}            ${discount range}[1]        ${legal latam rule}	    ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}    ${productQuantity 3}
    