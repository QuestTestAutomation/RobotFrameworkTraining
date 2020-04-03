*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Pro Services Leader Approval and Manager Approval

*** Variables ***
@{discount range}                              20.01    99.99
${data protection professional services}       SCD-VZC-CO    #WWB-SCL-PP    #DAF-BKB-CO
${data protection professional services #2}    DPA-BAK-PP    #KRK-KCE-PP
@{americas approvers}                          Scott Hetrick    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
@{emea approvers}                              Scott Hetrick    #Kevin Stanton	Brad Gardiner
&{americas leader rule}                           chain=Direct PS Sale Discount    rule=AMER DP Pro Services Leader Approval    approvers=@{americas approvers}
&{emea leader rule}                               chain=Direct PS Sale Discount    rule=EMEA DP Pro Services Leader Approval    approvers=@{emea approvers}
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

Data Protection NAM Direct - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader  
    [Tags]   C313532 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}[0]     ${americas leader rule}        ${NAM im pro services mgr rule}
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}        ${americas leader rule}        ${NAM im pro services mgr rule}
    ${NAM direct account oppty}         ${data protection professional services}          ${discount range}[1]     ${americas leader rule}        ${NAM im pro services mgr rule}
    
 
Data Protection EMEA Direct - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader 
    [Tags]     C313533
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}[0]    ${emea leader rule}            ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}       ${emea leader rule}            ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${data protection professional services}          ${discount range}[1]    ${emea leader rule}            ${EMEA im pro services mgr rule}
    
    
Data Protection LATAM Direct Quote - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader
    [Tags]     C313534
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}[1]    ${americas leader rule}        ${LATAM im pro services mgr rule}   
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}       ${americas leader rule}        ${LATAM im pro services mgr rule}
    ${LATAM direct account oppty}       ${data protection professional services #2}        ${discount range}[0]    ${americas leader rule}        ${LATAM im pro services mgr rule}