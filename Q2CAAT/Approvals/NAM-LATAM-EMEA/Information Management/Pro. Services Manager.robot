*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval    #Create Quote with No Approval Required

*** Variables ***
@{discount range}	                        0.01    20
${inf mgmt prof services product}	        TPC-TOD-PP
${inf mgmt prof services product2}	        STH-SPX-PP
@{NAM im pro services mgr rule approvers}	       Mark Gowdy
                                            ...    Lori Wittal
&{NAM im pro services mgr rule}	            chain=Direct PS Sale Discount    rule=AMER IM Pro Services Manager Approval	        approvers=@{NAM im pro services mgr rule approvers}
@{LATAM im pro services mgr rule approvers}	Rogerio Soares
&{LATAM im pro services mgr rule}	        chain=Direct PS Sale Discount    rule=LATAM Quest Pro Services Manager Approval	    approvers=@{LATAM im pro services mgr rule approvers}
@{EMEA im pro services mgr rule approvers}	       Farooq Hussain
	                                        ...    Rupert Miller
	                                        ...    Wiebke Dautert
	                                        ...    William Barfoot
	                                        ...    Phil Welsh
	                                        ...    Ales Zeman
	                                        ...    Joel Chenelat
	                                        ...    Pablo Sanchez
	                                        ...    John Coady
&{EMEA im pro services mgr rule}	        chain=Direct PS Sale Discount    rule=EMEA IM Pro Services Manager Approval	        approvers=@{EMEA im pro services mgr rule approvers}


*** Test Cases ***

Information Mgmt. NAM Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required 
    [Tags]   C313508 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${inf mgmt prof services product}          ${discount range}[0]	    ${NAM im pro services mgr rule}  
    ${NAM direct account oppty}         ${inf mgmt prof services product}          ${discount range}	    ${NAM im pro services mgr rule}
    ${NAM direct account oppty}         ${inf mgmt prof services product}          ${discount range}[1]	    ${NAM im pro services mgr rule}        
    
 
Information Mgmt. EMEA Direct - Professional Services - Up to 20% Discount - Auto Approved- No approval required 
    [Tags]     C313509
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${inf mgmt prof services product}          ${discount range}[0]	    ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${inf mgmt prof services product}          ${discount range}	    ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${inf mgmt prof services product}          ${discount range}[1]	    ${EMEA im pro services mgr rule}
    
    
Information Mgmt. LATAM Direct - Professional Services - Up to 20% Discount - Auto Approved- No approval required
    [Tags]     C313510
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}          ${discount range}[0]	${LATAM im pro services mgr rule}   
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}          ${discount range}	    ${LATAM im pro services mgr rule}
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}          ${discount range}[1]	${LATAM im pro services mgr rule}