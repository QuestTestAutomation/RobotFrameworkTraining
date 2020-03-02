*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range}                      60.01    100
@{channel discount range}              20	    100
${one identity license product #1}     EAY-DMZ-PB-247
${one identity license product #2}     MDP-DMZ-CH
${one identity license product #3}     ENT-DMZ-CH
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	            approvers=@{director approvers}
&{channel director rule}               chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - OI	    approvers=@{director approvers}
@{AMER leader approvers}               Edwin Bowman
&{AMER leader rule}                    chain=Direct New Sale Discount    rule=AMER OI Sales Leader Approval	                    approvers=@{AMER leader approvers}
&{channel AMER leader rule}            chain=Channel New Sale Discount   rule=AMER OI Sales Leader Approval - Channel Discount	approvers=@{AMER leader approvers}
@{EMEA leader approvers}               Ian Sutherland
&{EMEA leader rule}                    chain=Direct New Sale Discount    rule=EMEA OI Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA leader rule}            chain=Channelt New Sale Discount  rule=EMEA OI Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
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
Identity and Security Mgmt. NAM Direct - New Sales On-Prem License - One Identity - More than 60% Discount - Approvals should be sent to "Sales Manager / Country Manager / Director" , "Regional Business Unit Sales Leader" , "Deal Desk"
    [Tags]    C313488
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}[0]    ${legal us-can rule}    ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}       ${legal us-can rule}    ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}[1]    ${legal us-can rule}    ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}

Identity and Security Mgmt. EMEA Direct - New Sales On-Prem License - One Identity - More than 60% Discount - Approvals should be sent to "Sales Manager / Country Manager / Director" , "Regional Business Unit Sales Leader" , "Deal Desk"
    [Tags]    C313489
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[0]    ${legal emea rule}      ${EMEA leader rule}    ${director rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}       ${legal emea rule}      ${EMEA leader rule}    ${director rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[1]    ${legal emea rule}      ${EMEA leader rule}    ${director rule}    ${EMEA step 4 rule}

Identity and Security Mgmt. LATAM Direct - New Sales On-Prem License - One Identity - More than 60% Discount - Approvals should be sent to "Sales Manager / Country Manager / Director" , "Regional Business Unit Sales Leader" , "Deal Desk"
    [Tags]    C313490
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}[0]    ${legal latam rule}     ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}       ${legal latam rule}     ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}[1]    ${legal latam rule}     ${AMER leader rule}    ${director rule}    ${AMER step 4 rule}
    
Identity and Security Mgmt. NAM Channel Quote Discount-of 20% or greater - APPROVER is DEAL DESK along with Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313560
    ${NAM channel account oppty}      ${one identity license product #3}            ${channel discount range}[0]    ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}
    ${NAM channel account oppty}      ${one identity license product #3}            ${channel discount range}       ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}
    ${NAM channel account oppty}      ${one identity license product #3}            ${channel discount range}[1]    ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}

Identity and Security Mgmt. LATAM Channel Quote Discount-of 20% or greater - APPROVER is DEAL DESK along with Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313562
    ${LATAM channel account oppty}    ${one identity license product #3}	        ${channel discount range}[0]    ${legal latam rule}     ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}
    ${LATAM channel account oppty}    ${one identity license product #3}	        ${channel discount range}       ${legal latam rule}     ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}
    ${LATAM channel account oppty}    ${one identity license product #3}	        ${channel discount range}[1]    ${legal latam rule}     ${channel AMER leader rule}    ${channel director rule}    ${channel AMER step 4 rule}
    