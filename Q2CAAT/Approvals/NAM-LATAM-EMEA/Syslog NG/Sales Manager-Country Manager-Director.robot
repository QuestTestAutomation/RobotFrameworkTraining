*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Sales Mgr Approval and Legal Approval

*** Variables ***
@{discount range}                       25.01    40
${oid syslog license product}           BYA-BAL-PB-247
${oid syslog license product 2}         BAY-BAL-PB-247
${oid syslog license product 3}         BYB-BAL-PB-247
@{approvers}                            David Stepancich
&{pm im rule}                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{approvers}

*** Test Cases ***
One identity Syslog NG Products - Region NAM and LATAM - More than 25% and up to 40% "Sales Manager / Country Manager / Director"
    [Tags]    C408731
    ${NAM direct account oppty}         ${oid syslog license product}            ${discount range}[0]        ${legal us-can rule}	${pm im rule}
    ${EMEA direct account oppty}        ${oid syslog license product}            ${discount range}[1]        ${legal emea rule}	    ${pm im rule}
    ${LATAM direct account oppty}       ${oid syslog license product}            ${discount range}           ${legal latam rule}	${pm im rule}
