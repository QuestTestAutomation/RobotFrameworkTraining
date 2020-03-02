*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval    #Create Quote with No Approval Required

*** Variables ***
@{discount range}	                            0.01    20
${data protection professional services}	    SCD-VZC-CO    #WWB-SCL-PP    #DAF-BKB-CO
${data protection professional services #2}	    DPA-BAK-PP    #KRK-KCE-PP
@{NAM im pro services mgr rule approvers}	           Scott Hetrick
                                                ...    Eddie Huang
&{NAM im pro services mgr rule}	                chain=Direct PS Sale Discount    rule=AMER DP Pro Services Manager Approval	        approvers=@{NAM im pro services mgr rule approvers}
@{LATAM im pro services mgr rule approvers}	    Rogerio Soares
&{LATAM im pro services mgr rule}	            chain=Direct PS Sale Discount    rule=LATAM Quest Pro Services Manager Approval	    approvers=@{LATAM im pro services mgr rule approvers}
@{EMEA im pro services mgr rule approvers}	           Rupert Miller
	                                            ...    Andy Lawrie
	                                            ...    Kevin Stanton
&{EMEA im pro services mgr rule}	            chain=Direct PS Sale Discount    rule=EMEA DP Pro Services Manager Approval	        approvers=@{EMEA im pro services mgr rule approvers}

*** Test Cases ***

Data Protection NAM Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required 
    [Tags]   C313528 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}[0]	    ${NAM im pro services mgr rule}  
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}	        ${NAM im pro services mgr rule}   
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}[1]	    ${NAM im pro services mgr rule}
    
 
Data Protection EMEA Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required 
    [Tags]     C313529
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}[0]	    ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}	        ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}[1]	    ${EMEA im pro services mgr rule}
    
    
Data Protection LATAM Direct Quote - Professional Services - Up to 20% Discount- Auto Approved- No approval required
    [Tags]     C313530
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}[1]	    ${LATAM im pro services mgr rule}
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}        ${LATAM im pro services mgr rule}
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}[0]	    ${LATAM im pro services mgr rule}