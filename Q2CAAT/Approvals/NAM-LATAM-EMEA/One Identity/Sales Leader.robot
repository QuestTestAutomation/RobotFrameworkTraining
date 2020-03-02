*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range}                      30.01    60
@{channel discount range}              10.00    19.99
${one identity license product #1}     STD-DMZ-CH
${one identity license product #2}     PRQ-DDS-PB
${one identity license product #3}     SFA-SFG-CB
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
Identity and Security Mgmt. NAM Direct - New Sales On-Prem License - One Identity - More than 30% to 60% Discount - APPROVERs are Sales Manager / Country Manager / Director and Regional Business Unit Sales Leader
    [Tags]    C313484
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}[0]        ${legal us-can rule}    ${AMER leader rule}    ${director rule}
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}           ${legal us-can rule}    ${AMER leader rule}    ${director rule}
    ${NAM direct account oppty}       ${one identity license product #1}            ${discount range}[1]        ${legal us-can rule}    ${AMER leader rule}    ${director rule}

Identity and Security Mgmt. EMEA Direct- New Sales On-Prem License - One Identity - More than 30% to 60% Discount - APPROVERs are Sales Manager / Country Manager / Director and Regional Business Unit Sales Leader
    [Tags]    C313485
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[0]        ${legal emea rule}      ${EMEA leader rule}    ${director rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}	        ${legal emea rule}      ${EMEA leader rule}    ${director rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[0]	    ${legal emea rule}	    ${EMEA leader rule}    ${director rule}

Identity and Security Mgmt. LATAM Direct - New Sales On-Prem License - One Identity - More than 30% to 60% Discount - APPROVERs are Sales Manager / Country Manager / Director and Regional Business Unit Sales Leader
    [Tags]    C313486
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}[0]        ${legal latam rule}     ${AMER leader rule}    ${director rule}
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}           ${legal latam rule}     ${AMER leader rule}    ${director rule}
    ${LATAM direct account oppty}     ${one identity license product #3}            ${discount range}[1]        ${legal latam rule}     ${AMER leader rule}    ${director rule}

Identity and Security Mgmt. NAM Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - Approvals should be sent to Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313504
    ${NAM channel account oppty}      ${one identity license product #2}            ${channel discount range}[0]        ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}
    ${NAM channel account oppty}      ${one identity license product #2}            ${channel discount range}           ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}
    ${NAM channel account oppty}      ${one identity license product #2}            ${channel discount range}[1]        ${legal us-can rule}    ${channel AMER leader rule}    ${channel director rule}

Identity and Security Mgmt. EMEA Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - Approvals should be sent to Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313505
    ${EMEA channel account oppty}      ${one identity license product #3}           ${channel discount range}[0]        ${legal emea rule}    ${channel EMEA leader rule}    ${channel director rule}
    ${EMEA channel account oppty}      ${one identity license product #3}           ${channel discount range}           ${legal emea rule}    ${channel EMEA leader rule}    ${channel director rule}
    ${EMEA channel account oppty}      ${one identity license product #3}           ${channel discount range}[1]        ${legal emea rule}    ${channel EMEA leader rule}    ${channel director rule}

Identity and Security Mgmt. LATAM Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - Approvals should be sent to Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313506
    ${LATAM channel account oppty}     ${one identity license product #3}           ${channel discount range}[0]        ${legal latam rule}    ${channel AMER leader rule}    ${channel director rule}
    ${LATAM channel account oppty}     ${one identity license product #3}           ${channel discount range}           ${legal latam rule}    ${channel AMER leader rule}    ${channel director rule}
    ${LATAM channel account oppty}     ${one identity license product #3}           ${channel discount range}[1]        ${legal latam rule}    ${channel AMER leader rule}    ${channel director rule}
    