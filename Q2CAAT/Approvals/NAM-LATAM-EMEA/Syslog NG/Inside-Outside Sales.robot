*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}                0    25
${syslog license product}        BAK-BAL-CB-247        


*** Test Cases ***

One identity Syslog NG Products - Region NAM and LATAM - up to 15% NO APPROVAL REQUIRED
    [Tags]    C408730
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                     |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}           ${syslog license product}        ${discount range}[0]        ${legal us-can rule}
    ${EMEA direct account oppty}          ${syslog license product}        ${discount range}           ${legal emea rule}           
    ${LATAM direct account oppty}         ${syslog license product}        ${discount range}[1]        ${legal latam rule}
    