*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range USD}                          20.01    28
${id and sec mgmt prof services product}       ARA-VNT-PP
${id and sec mgmt prof services product 2}     IAP-VNT-PP
@{americas approvers}                          Mark Ruwoldt
@{emea approvers}                              Gordon Patzschke
&{americas oi director rule}                   chain=Direct PS Sale Discount    rule=AMER OI Pro Services Director Approval    approvers=@{americas approvers}
&{emea oi director rule}                       chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Director Approval    approvers=@{emea approvers}
@{nam oi pro mgr approvers}                    Ward Buchanan
@{emea oi pro mgr approvers}                          Alexander Klink
                                               ...    Chris Rudd
@{latam oi pro mgr approvers}                  Marcelo Luis
&{nam oi mgr rule}                             chain=Direct PS Sale Discount    rule=AMER OI Pro Services Manager Approval        approvers=@{nam oi pro mgr approvers}
&{emea oi mgr rule}                            chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Manager Approval      approvers=@{emea oi pro mgr approvers}
&{latam oi mgr rule}                           chain=Direct PS Sale Discount    rule=LATAM OI Pro Services Manager Approval     approvers=@{latam oi pro mgr approvers}


*** Test Cases ***

Identity and Security Mgmt. LATAM Direct - Professional Services - More than 20 % to 28% Discount - APPROVER IS Pro. Services Director
    [Tags]    C313542
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}[0]        ${legal latam rule}         ${americas oi director rule}    ${latam oi mgr rule}
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}           ${legal latam rule}         ${americas oi director rule}    ${latam oi mgr rule}
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}[1]        ${legal latam rule}         ${americas oi director rule}    ${latam oi mgr rule}
    
Identity and Security Mgmt. EMEA Direct - Professional Services - More than 20 % to 28% Discount - APPROVER IS Pro. Services Director
    [Tags]    debug    C313541    noproduct
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal emea rule}          ${emea oi director rule}        ${emea oi mgr rule}
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}           ${legal emea rule}          ${emea oi director rule}        ${emea oi mgr rule}
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal emea rule}          ${emea oi director rule}        ${emea oi mgr rule}

Identity and Security Mgmt. NAM Direct - Professional Services - More than 20 % to 28% Discount - APPROVER IS Pro. Services Director
    [Tags]    C313540
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal us-can rule}        ${americas oi director rule}    ${nam oi mgr rule}
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}           ${legal us-can rule}        ${americas oi director rule}    ${nam oi mgr rule}
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}[1]        ${legal us-can rule}        ${americas oi director rule}    ${nam oi mgr rule}
