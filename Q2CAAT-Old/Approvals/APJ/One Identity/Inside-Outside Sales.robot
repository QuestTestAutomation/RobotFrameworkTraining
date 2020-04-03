*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Legal Approval Only

*** Variables ***
@{discount range}                      0    15
${one identity license product #1}     AAT-ATA-PB
${one identity license product #2}     AEM-DMX-TB-247
${one identity license product #3}     QQA-EVI-PB
${one identity license product #4}     ABA-VNT-PB-247

*** Test Cases ***

Identity and Security Mgmt. APJ Direct - New Sales On-Prem License - One Identity - Up to 15% Discount 
    [Tags]     C313479
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `    |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}       ${one identity license product #1}         ${discount range}[0]        ${legal apj rule}
    ${APJ direct account oppty USD}       ${one identity license product #2}         ${discount range}           ${legal apj rule}        
    ${APJ direct account oppty USD}       ${one identity license product #4}         ${discount range}[1]        ${legal apj rule}


    
