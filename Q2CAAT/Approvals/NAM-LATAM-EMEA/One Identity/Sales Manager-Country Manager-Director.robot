*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}                      15.01    30
${one identity license product #1}     ENT-DMZ-CH    #EDB-DMZ-PB-247
${one identity license product #2}     DMU-PGO-PB
${one identity license product #3}     EAV-DMZ-PB-247
@{approvers}                           David Stepancich
&{oid rule}                          chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{approvers}


*** Test Cases ***
Identity and Security Mgmt. LATAM Direct - New Sales On-Prem License - One Identity - More than 15% to 30% Discount-APPROVER is SALES REP MGR
    [Tags]    C313482
    ${LATAM direct account oppty}     ${one identity license product #1}            ${discount range}[0]        ${legal latam rule}         ${oid rule}
    ${LATAM direct account oppty}     ${one identity license product #1}            ${discount range}           ${legal latam rule}         ${oid rule}
    ${LATAM direct account oppty}     ${one identity license product #1}            ${discount range}[1]        ${legal latam rule}         ${oid rule}
    
Identity and Security Mgmt. EMEA Direct- New Sales On-Prem License - One Identity More than 15% to 30% Discount- APPROVED BY SALES REP MANAGER
    [Tags]    C313481
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[0]           ${legal emea rule}          ${oid rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}              ${legal emea rule}          ${oid rule}
    ${EMEA direct account oppty}      ${one identity license product #2}            ${discount range}[0]           ${legal emea rule}          ${oid rule}

Identity and Security Mgmt. NAM Direct - New Sales On-Prem License - One Identity - More than 15% to 30% Discount - APPROVER is SALES REP MGR
    [Tags]    C313480
    ${NAM direct account oppty}       ${one identity license product #3}            ${discount range}[0]        ${legal us-can rule}        ${oid rule}
    ${NAM direct account oppty}       ${one identity license product #3}            ${discount range}           ${legal us-can rule}        ${oid rule}
    ${NAM direct account oppty}       ${one identity license product #3}            ${discount range}[1]        ${legal us-can rule}        ${oid rule}


