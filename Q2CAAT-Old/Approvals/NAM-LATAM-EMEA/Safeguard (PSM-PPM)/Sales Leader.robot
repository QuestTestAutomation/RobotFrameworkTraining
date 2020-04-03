*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range}                      20.01    100
@{channel discount range}              10.00    19.99
${oid safeguard license product}       SPO-SFG-PB-247
${oid safeguard license product 2}     SFA-SFG-CB    #BAA-BAL-PB-247    #BZC-TS4-PB-247
${oid safeguard license product 3}     DAY-BAL-PB-247
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	            approvers=@{director approvers}
&{channel director rule}               chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - OI	    approvers=@{director approvers}
@{AMER leader approvers}               Edwin Bowman
&{AMER leader rule}                    chain=Direct New Sale Discount    rule=AMER OI Sales Leader Approval	                    approvers=@{AMER leader approvers}
&{channel AMER leader rule}            chain=Channel New Sale Discount   rule=AMER OI Sales Leader Approval - Channel Discount	approvers=@{AMER leader approvers}
@{EMEA leader approvers}               Ian Sutherland
&{EMEA leader rule}                    chain=Direct New Sale Discount    rule=EMEA OI Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA leader rule}            chain=Channel New Sale Discount   rule=EMEA OI Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}

*** Test Cases ***
 One identity Safe guard Products - Region NAM and LATAM - up to 30% should be sent to Sales Manager/Country Manager/Director and Regional Business Unit Sales Leader
    [Tags]    C408728
    ${NAM direct account oppty}       ${oid safeguard license product 2}            ${discount range}[0]	    ${legal us-can rule}    ${AMER leader rule}    ${director rule}
    ${EMEA direct account oppty}      ${oid safeguard license product 2}            ${discount range}	        ${legal emea rule}	    ${EMEA leader rule}    ${director rule}
    ${LATAM direct account oppty}     ${oid safeguard license product 2}            ${discount range}[1]	    ${legal latam rule}	    ${AMER leader rule}    ${director rule}
    