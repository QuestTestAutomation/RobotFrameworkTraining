*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}                       0    10
${oid safeguard license product}        SFA-SFG-CB    #SFM-SFG-PB-247    #SFC-SFG-PB-247


*** Test Cases ***
One identity Safe guard Products - Region NAM and LATAM - up to 10% NO APPROVAL REQUIRED
     [Tags]    C408715
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                            |   Prodcuct                                |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
     ${NAM direct account oppty}       ${oid safeguard license product}            ${discount range}[0]        ${legal us-can rule}
     ${EMEA direct account oppty}      ${oid safeguard license product}            ${discount range}           ${legal emea rule}
     ${LATAM direct account oppty}     ${oid safeguard license product}            ${discount range}[1]        ${legal latam rule}
    
