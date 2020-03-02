*** Settings ***
Resource    ../Resources/Commons/Global Setup.robot
Resource    ../Resources/Commons/SFDC Common Variables.robot
Resource    ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource    ../Resources/SFDC POM/Quotes/Quote Operations.robot
Resource    ../Resources/SFDC POM/Quote Lines/Quote Lines Operations.robot
Resource    ../Resources/SFDC POM/Approvals/Approvals.robot
Resource    ../Resources/SFDC POM/Login/Login.robot
Resource    ../Resources/Commons/SFDX.robot

*** Variables ***
${subscription term if 0}    12
${base payment term}         Net 30

*** Keywords ***
Create Quote with Leader Approval
    [Arguments]    ${oppty}    ${products}    ${discount range}    ${rule}
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '3'
    Check Approval Step    3    ${rule}[chain]    ${rule}[rule]    ${rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '2'    
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with Pro Services Leader Approval and Manager Approval
    [Arguments]    ${oppty}    ${products}    ${discount range}    ${rule leader}    ${rule manager}
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '4'
    Check Approval Step    4    ${rule leader}[chain]    ${rule leader}[rule]    ${rule leader}[approvers]
    Preview Approvals Page Should Contain Step '2'    
    Check Approval Step    2    ${rule manager}[chain]    ${rule manager}[rule]    ${rule manager}[approvers]
    Preview Approvals Page Should NOT Contain Step '3'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with Leader Approval and Director Approval
    [Arguments]    ${oppty}    ${products}    ${discount range}    ${step 3 rule}    ${step 2 rule}
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${step 2 rule}[chain]    ${step 2 rule}[rule]    ${step 2 rule}[approvers]
    Preview Approvals Page Should Contain Step '3'
    Check Approval Step    3    ${step 3 rule}[chain]    ${step 3 rule}[rule]    ${step 3 rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with Extended Payment Terms and check approvals
    [Arguments]   ${oppty}    ${products}    ${term}    ${rule}
     Wait Until Keyword Succeeds    5 times    5 sec     Open 'Opportunity' with name '${oppty}'
     Wait Until Keyword Succeeds    5 times    5 sec     Create Quote for Oppty '${oppty}'
     Log Many     Oppty: ${oppty}    Quote: ${NEW_QUOTE_NUMBER}    Product: ${products}    Term: ${term}
     Quote Property 'Status' should conatin 'Draft'
     Go To Configure Products Page
     Add Products by Codes    ${products}
     Save Products
	 Set Payment Term to '${term}' 
	 : FOR    ${index}    IN RANGE    5
	 \    sleep    5
	 \    log    ${index}   
     \    ${db_payment_term}    Get Payment Term for Quote '${NEW_QUOTE_NUMBER}'	
     \    Run Keyword IF    "['${term}']"!="${db_payment_term}"    Set Payment Term to '${term}'
     \    ...    ELSE    Exit For Loop
     Go To Preview Approval     
     No Approval Required Notification should NOT be show
     Check Approval Step    2    ${rule}[chain]    ${rule}[rule]    ${rule}[approvers]
     Set Test Message    \n\nProduct: ${products}    append=True
     Set Test Message    \n\n-----------------------------------    append=True    
    
    

Create Quote With Maintenece Start Date in Future and check approvals
    [Arguments]   ${oppty}    ${products}    ${maintenance start date}    ${mgr rule}    ${dd rule}
    Wait Until Keyword Succeeds    5 times    5 sec     Open 'Opportunity' with name '${oppty}'
    Wait Until Keyword Succeeds    5 times    5 sec     Create Quote for Oppty '${oppty}'
    Log Many     Oppty: ${oppty}    Quote: ${NEW_QUOTE_NUMBER}    Product: ${products}    New date: ${maintenance start date}
    Quote Property 'Status' should conatin 'Draft'
    Go To Configure Products Page
    Add Products by Codes    ${products}
    Set Product Maintenance Start Date    ${products}    ${maintenance start date}
    #Set Subscription Term if 0    ${products}    ${subscription term if 0}
    Save Products
    Go To Preview Approval
    No Approval Required Notification should NOT be show
    Check Approval Step    2    ${mgr rule}[chain]    ${mgr rule}[rule]    ${mgr rule}[approvers]
    Check Approval Step    3    ${dd rule}[chain]    ${dd rule}[rule]    ${dd rule}[approvers]
    #Click Submit for Approval
    #Quote Property 'Status' should conatin '1- Waiting Mgmt Approval'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\n-----------------------------------    append=True       
     

Create Quote with No Approval Required
    [Arguments]   ${oppty}    ${products}    ${discount range} 
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}
    Go To Preview Approval
    No Approval Required Notification should be shown
    Click Return to CPQ Quote
    #Click Submit for Approval
    #Quote Property 'Status' should conatin '2 - Approved by Mgmt'
    #Quote Line for '${products}' Should Contian '${discount}' Total Discount
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote With Maintenece Start Date in Future and check approvals
    [Arguments]   ${oppty}    ${products}    ${maintenance start date}    ${future maint mgr rule}    ${future maint dd rule}     ${legal rule}
    ${product business unit}    Get Product Business Unit    ${products}
    Should Be Equal As Strings    ${product business unit}    Identity and Security Management    msg=BU of '${products}' should be 'Identity and Security Management'
    Wait Until Keyword Succeeds    5 times    5 sec     Open 'Opportunity' with name '${oppty}'
    Wait Until Keyword Succeeds    5 times    5 sec     Create Quote for Oppty '${oppty}'
    Log Many     Oppty: ${oppty}    Quote: ${NEW_QUOTE_NUMBER}    Product: ${products}    New date: ${maintenance start date}
    Quote Property 'Status' should conatin 'Draft'
    Go To Configure Products Page
    Add Products by Codes    ${products}
    #Set Subscription Term if 0    ${products}    ${subscription term if 0}
    Set Product Maintenance Start Date    ${products}    ${maintenance start date}
    Save Products
    Go To Preview Approval
    No Approval Required Notification should NOT be show
    Check Approval Step    1    ${legal rule}[chain]    ${legal rule}[rule]    ${legal rule}[approvers]
    Check Approval Step    2    ${future maint mgr rule}[chain]    ${future maint mgr rule}[rule]    ${future maint mgr rule}[approvers]
    Check Approval Step    3    ${future maint dd rule}[chain]    ${future maint dd rule}[rule]    ${future maint dd rule}[approvers]
    #Click Submit for Approval
    #Quote Property 'Status' should conatin '1- Waiting Mgmt Approval'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\n-----------------------------------    append=True 
    

Create OID Quote with Legal Approval Only
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${rule}
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1
    Go To Preview Approval
    OID Legal Apprroval required only    ${rule}[rule]    ${rule}[chain]    ${rule}[approvers]   
    #No Approval Required Notification shoud be shown
    #Click Submit for Approval
    Click Return to CPQ Quote
    #Quote Property 'Status' should conatin '2 - Approved by Mgmt'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote with Legal Approval and PSO Approval
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${legal rule}    ${pso rule}
    Product should be PSO Required    ${products}
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1
    Delete All Professional Services Quote Lines    
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '1'
    Check Approval Step    1    ${legal rule}[rule]    ${legal rule}[chain]    ${legal rule}[approvers]
    Check Approval Step    1    ${pso rule}[rule]	   ${pso rule}[chain]	   ${pso rule}[approvers]    
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with PSO Approval
    [Arguments]   ${oppty}    ${product}    ${discount range}    ${pso rule}
    Product should be PSO Required    ${product}
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${product}    ${discount}
    Delete All Professional Services Quote Lines
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '1'
    Check Approval Step    1    ${pso rule}[rule]	   ${pso rule}[chain]	   ${pso rule}[approvers]
    Set Test Message    \n\nProduct: ${product}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True    
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote with Sales Mgr Approval and Legal Approval
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${legal rule}    ${sales mgr rule}    
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '1'
    Check Approval Step    1    ${legal rule}[rule]    ${legal rule}[chain]    ${legal rule}[approvers]
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${sales mgr rule}[chain]    ${sales mgr rule}[rule]    ${sales mgr rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '3'
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote with Pro Services Mgr Approval
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${sales mgr rule}    
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${sales mgr rule}[chain]    ${sales mgr rule}[rule]    ${sales mgr rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '1'    
    Preview Approvals Page Should NOT Contain Step '3'
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote with Leader Approval, Director Approval and Legal Approval
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${legal rule}    ${leader rule}    ${director rule}    
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '1'
    Check Approval Step    1    ${legal rule}[rule]    ${legal rule}[chain]    ${legal rule}[approvers]
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${director rule}[chain]    ${director rule}[rule]    ${director rule}[approvers]
    Preview Approvals Page Should Contain Step '3'
    Check Approval Step    3    ${leader rule}[chain]    ${leader rule}[rule]    ${leader rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create OID Quote with DealDesk, Leader, Director and Legal Approvals    
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${legal rule}    ${leader rule}    ${director rule}    ${DealDesk rule}    ${productQuantity}=1    
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}    isOID=1    productQuantity=${productQuantity}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '1'
    Check Approval Step    1    ${legal rule}[rule]    ${legal rule}[chain]    ${legal rule}[approvers]
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${director rule}[chain]    ${director rule}[rule]    ${director rule}[approvers]
    Preview Approvals Page Should Contain Step '3'
    Check Approval Step    3    ${leader rule}[chain]    ${leader rule}[rule]    ${leader rule}[approvers]
    Preview Approvals Page Should Contain Step '4'
    Check Approval Step    4    ${DealDesk rule}[chain]    ${DealDesk rule}[rule]    ${DealDesk rule}[approvers]
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with Leader Approval, Director Approval and DealDesk Approval
    [Arguments]   ${oppty}    ${products}    ${discount range}    ${leader rule}    ${director rule}    ${DealDesk rule} 
    ${discount}    Generate Random Discount From Range    ${discount range}
    Create Quote for Approvals    ${oppty}    ${products}    ${discount} 
    ${approvers_step2}    Set Variable    []    #Get Delegated Approver for Rule '${director rule}[rule]'
    ${approvers_step3}    Set Variable    []    #Get Delegated Approver for Rule '${leader rule}[rule]'
    ${approvers_step4}    Set Variable    []    #Get Delegated Approver for Rule '${DealDesk rule}[rule]'
    ${approvers_step2}    Set Variable If    "${approvers_step2}"=="[]"    ${director rule}[approvers]    ${approvers_step2}
    ${approvers_step3}    Set Variable If    "${approvers_step3}"=="[]"    ${leader rule}[approvers]    ${approvers_step3}
    ${approvers_step4}    Set Variable If    "${approvers_step4}"=="[]"    ${DealDesk rule}[approvers]    ${approvers_step4}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${director rule}[chain]    ${director rule}[rule]    ${approvers_step2}    #${director rule}[approvers]
    Preview Approvals Page Should Contain Step '3'
    Check Approval Step    3    ${leader rule}[chain]    ${leader rule}[rule]    ${approvers_step3}    #${leader rule}[approvers]
    Preview Approvals Page Should Contain Step '4'
    Check Approval Step    4    ${DealDesk rule}[chain]    ${DealDesk rule}[rule]     ${approvers_step4}    #${DealDesk rule}[approvers]
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Create Quote with Sales Mgr Approval
    [Arguments]    ${oppty}    ${products}    ${discount range}    ${rule}        #${approval chain}    ${approval rule}
    ${discount}    Generate Random Discount From Range    ${discount range} 
    Create Quote for Approvals    ${oppty}    ${products}    ${discount}
    Go To Preview Approval
    Preview Approvals Page Should Contain Step '2'
    Check Approval Step    2    ${rule}[chain]    ${rule}[rule]    ${rule}[approvers]
    Preview Approvals Page Should NOT Contain Step '3'
    Preview Approvals Page Should NOT Contain Step '4'
    Set Test Message    \n\nProduct: ${products}    append=True
    Set Test Message    \n\nDiscount: ${discount}    append=True
    Set Test Message    \n\n-----------------------------------    append=True

Generate Random Discount From Range
    [Arguments]    ${discount range}
    ${type}    Evaluate    type(${discount range}).__name__    
    log    ${type}
    Return From Keyword If    '${type}' in ('int', 'float')   ${discount range}
    #${range}    Replace String    ${discount range}    -    ,
    #${range}    Replace String    ${range}    ${SPACE}    ${EMPTY}
    ${random discount}    Evaluate    round(random.uniform(${discount range}[0], ${discount range}[1]), 1)     modules=random
    ${random discount}    Convert To String    ${random discount} 
    [Return]    ${random discount}    

Approvals Suite Setup
    Suite Setup
    Wait Until Keyword Succeeds    5 times    5 sec    Login To SFDC sandbox
    
Approvals Suite Teardown
    Test Teardown

OID Legal Apprroval required only
    [Arguments]    ${legal chain}    ${legal rule}    ${approvers}=[]
    Check Approval Step    1    ${legal chain}    ${legal rule}    ${approvers}
    Preview Approvals Page Should NOT Contain Step '2'
    Preview Approvals Page Should NOT Contain Step '3'
    Preview Approvals Page Should NOT Contain Step '4'
    
Set Payment Term to '${payment term}'
    ${current payment term}    Get value of property 'Payment Terms' from section 'Bill To'
    #Return From Keyword If    '${current payment term}' == '${payment term}'
    Go To Edit Quote screen
    Select value '${payment term}' for property 'Payment Terms' from section 'Bill To'
    Save Quote
    
Create Quote for Approvals
    [Arguments]   ${oppty}    ${products}    ${discount}    ${isOID}=0    ${productQuantity}=1
    ${product business unit}    Get Product Business Unit    ${products}
    Run Keyword If    ${isOID}==1    Should Be Equal As Strings    ${product business unit}    Identity and Security Management    msg=BU of '${products}' should be 'Identity and Security Management'
    Wait Until Keyword Succeeds    5 times    5 sec     Open 'Opportunity' with name '${oppty}'
    Wait Until Keyword Succeeds    5 times    5 sec     Create Quote for Oppty '${oppty}'
    Log Many     Oppty: ${oppty}    Quote: ${NEW_QUOTE_NUMBER}    Product: ${products}    Discount: ${discount}
    Quote Property 'Status' should conatin 'Draft'
    Set Payment Term to '${base payment term}'    
    Go To Configure Products Page
    Add Products by Codes    ${products}
    Run Keyword IF    ${productQuantity}!=1    Set Product Quantity    ${products}    ${productQuantity}    
    Set Product Discount    ${products}    ${discount}
    #Set Subscription Term if 0    ${products}    ${subscription term if 0}
    Set all Subscription Terms with '0' to '${subscription term if 0}' 
    Save Products
    #Quote Line for '${products}' Should Contian '${discount}' Total Discount
    
Product should be PSO Required
    [Arguments]    ${product code}
    ${is pso required}    Get PSO Required status    ${product code}
    Should Be True    '${is pso required}'=='true'    msg='${product code}' is not a PSO Required product           
     
    