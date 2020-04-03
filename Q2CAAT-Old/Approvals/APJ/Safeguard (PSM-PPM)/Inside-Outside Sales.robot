*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}               0    10
${oid safeguard license}        DAX-BAL-PB-247    #AFT-SFG-TB-247    #SFM-SFG-PB-247                   

*** Test Cases ***

One identity Safeguard Product - Region APJ - up to 10% NO APPROVAL REQUIRED
    [Tags]    C408745
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                       |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------     
    ${APJ direct account oppty USD}        ${oid safeguard license}           ${discount range}[0]        ${legal apj rule} 
    ${APJ direct account oppty USD}        ${oid safeguard license}           ${discount range}           ${legal apj rule}
    ${APJ direct account oppty USD}        ${oid safeguard license}           ${discount range}[1]        ${legal apj rule}
  
