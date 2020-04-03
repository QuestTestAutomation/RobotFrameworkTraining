*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}                0    15
${syslog license product}        BAA-BAL-CB    #CAA-BAL-TB-247    #BYB-BAL-PB-247        


*** Test Cases ***

One identity syslog Product - Region APJ - up to 15% NO APPROVAL REQUIRED
    [Tags]    C408749 
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}        ${syslog license product}                 ${discount range}[0]        ${legal apj rule}
    ${APJ direct account oppty USD}        ${syslog license product}                 ${discount range}           ${legal apj rule}
    ${APJ direct account oppty USD}        ${syslog license product}                 ${discount range}[1]        ${legal apj rule}

