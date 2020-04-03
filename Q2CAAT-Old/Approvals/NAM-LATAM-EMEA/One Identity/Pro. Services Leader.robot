*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range USD}                          28.01    99.99
@{discount range USD waiver}                   0    99.99
${id and sec mgmt prof services product}       AEP-VOL-CO
${id and sec mgmt prof services product 2}     IAP-VNT-PP
@{americas leader approvers}                   Gordon White
@{emea leader approvers}                       Gordon White
&{americas leader rule}                        chain=Direct PS Sale Discount    rule=AMER OI Pro Services Leader Approval    approvers=@{americas leader approvers}
&{emea leader rule}                            chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Leader Approval    approvers=@{emea leader approvers}
@{americas director approvers}                 Mark Ruwoldt
@{emea director approvers}                     Gordon Patzschke
&{americas director rule}                      chain=Direct PS Sale Discount    rule=AMER OI Pro Services Director Approval    approvers=@{americas director approvers}
&{emea director rule}                          chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Director Approval    approvers=@{emea director approvers}
@{nam oi pro mgr approvers}                    Ward Buchanan
@{emea oi pro mgr approvers}                          Alexander Klink
                                               ...    Chris Rudd
@{latam oi pro mgr approvers}                  Marcelo Luis
&{nam oi mgr rule}                             chain=Direct PS Sale Discount    rule=AMER OI Pro Services Manager Approval       approvers=@{nam oi pro mgr approvers}
&{emea oi mgr rule}                            chain=Direct PS Sale Discount    rule=EMEA OI Pro Services Manager Approval      approvers=@{emea oi pro mgr approvers}
&{latam oi mgr rule}                           chain=Direct PS Sale Discount    rule=LATAM OI Pro Services Manager Approval     approvers=@{latam oi pro mgr approvers}

*** Test Cases ***

Identity and Security Mgmt. LATAM Direct- Professional Services - More than 28% Discount - APPROVER IS Business Unit Pro Services Leader
    [Tags]    C313546
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}[0]        ${legal latam rule}         ${americas director rule}    ${latam oi mgr rule}    ${americas leader rule}
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}           ${legal latam rule}         ${americas director rule}    ${latam oi mgr rule}    ${americas leader rule}
    ${LATAM direct account oppty}     ${id and sec mgmt prof services product 2}          ${discount range USD}[1]        ${legal latam rule}         ${americas director rule}    ${latam oi mgr rule}    ${americas leader rule}
    
Identity and Security Mgmt. EMEA Direct- Professional Services - More than 28% Discount - APPROVER IS Business Unit Pro Services Leader
    [Tags]    debug    C313545    noproduct
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal emea rule}          ${emea director rule}        ${emea oi mgr rule}    ${emea leader rule}
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}           ${legal emea rule}          ${emea director rule}        ${emea oi mgr rule}    ${emea leader rule}
    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal emea rule}          ${emea director rule}        ${emea oi mgr rule}    ${emea leader rule}

Identity and Security Mgmt. NAM Direct- Professional Services - More than 28% Discount - APPROVER IS Business Unit Pro Services Leader
    [Tags]    C313544
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}[0]        ${legal us-can rule}        ${americas director rule}    ${nam oi mgr rule}    ${americas leader rule}
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}           ${legal us-can rule}        ${americas director rule}    ${nam oi mgr rule}    ${americas leader rule}
    ${NAM direct account oppty}       ${id and sec mgmt prof services product}            ${discount range USD}[1]        ${legal us-can rule}        ${americas director rule}    ${nam oi mgr rule}    ${americas leader rule}
    