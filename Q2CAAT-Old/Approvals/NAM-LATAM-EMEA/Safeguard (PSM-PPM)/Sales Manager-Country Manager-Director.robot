*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}                          10.01    20
${oid safeguard license product}           SPO-SFG-PB-247    #SFC-SFG-PB-247
@{approvers}                               David Stepancich
&{pm im rule}                              chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{approvers}

*** Test Cases ***
One identity Safe guard Products - Region NAM and LATAM - up to 20% Sales Manager / Country Manager / Director
    [Tags]    C408727
    ${NAM direct account oppty}         ${oid safeguard license product}            ${discount range}[0]        ${legal us-can rule}        ${pm im rule}
    ${EMEA direct account oppty}        ${oid safeguard license product}            ${discount range}           ${legal emea rule}	        ${pm im rule}
    ${LATAM direct account oppty}       ${oid safeguard license product}            ${discount range}[1]        ${legal latam rule}	        ${pm im rule}
