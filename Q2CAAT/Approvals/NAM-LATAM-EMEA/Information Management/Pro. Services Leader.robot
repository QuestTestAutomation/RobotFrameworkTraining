*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Pro Services Leader Approval and Manager Approval

*** Variables ***
@{discount range}                              20.01    99.99
${inf mgmt prof services product}              TPC-TOD-PP
${inf mgmt prof services product2}             STH-SPX-PP
@{NAM im pro services mgr rule approvers}             Mark Gowdy
                                               ...    Lori Wittal
&{NAM im pro services mgr rule}                chain=Direct PS Sale Discount    rule=AMER IM Pro Services Manager Approval	        approvers=@{NAM im pro services mgr rule approvers}
@{LATAM im pro services mgr rule approvers}    Rogerio Soares
&{LATAM im pro services mgr rule}              chain=Direct PS Sale Discount    rule=LATAM Quest Pro Services Manager Approval	    approvers=@{LATAM im pro services mgr rule approvers}
@{EMEA im pro services mgr rule approvers}            Farooq Hussain
	                                           ...    Rupert Miller
	                                           ...    Wiebke Dautert
	                                           ...    William Barfoot
	                                           ...    Phil Welsh
	                                           ...    Ales Zeman
	                                           ...    Joel Chenelat
	                                           ...    Pablo Sanchez
	                                           ...    John Coady
&{EMEA im pro services mgr rule}               chain=Direct PS Sale Discount    rule=EMEA IM Pro Services Manager Approval	        approvers=@{EMEA im pro services mgr rule approvers}
@{americas approvers}                          Mark Gowdy
@{emea approvers}                              Ales Zeman
&{americas leader rule}                        chain=Direct PS Sale Discount    rule=AMER IM Pro Services Leader Approval    approvers=@{americas approvers}
&{emea leader rule}                            chain=Direct PS Sale Discount    rule=EMEA IM Pro Services Leader Approval    approvers=@{emea approvers}


*** Test Cases ***

Information Mgmt. NAM Direct - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader  
    [Tags]   C313512 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                           |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${inf mgmt prof services product}	    ${discount range}[0]	${americas leader rule}	    ${NAM im pro services mgr rule} 
    ${NAM direct account oppty}         ${inf mgmt prof services product}	    ${discount range}	    ${americas leader rule}	    ${NAM im pro services mgr rule}
    ${NAM direct account oppty}         ${inf mgmt prof services product}	    ${discount range}[1]	${americas leader rule}	    ${NAM im pro services mgr rule}
    
 
Information Mgmt. EMEA Direct - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader 
    [Tags]     C313513
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                           |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${inf mgmt prof services product}	    ${discount range}[0]    ${emea leader rule}	        ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${inf mgmt prof services product}	    ${discount range}       ${emea leader rule}	        ${EMEA im pro services mgr rule}
    ${EMEA direct account oppty}        ${inf mgmt prof services product}	    ${discount range}[1]    ${emea leader rule}	        ${EMEA im pro services mgr rule}
    
    
Information Mgmt. LATAM Direct - Professional Services - More than 20% Discount - APPROVER IS Business Unit Pro Services Leader
    [Tags]     C313514
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                           |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}	    ${discount range}[1]    ${americas leader rule}	    ${LATAM im pro services mgr rule}	    
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}	    ${discount range}       ${americas leader rule}	    ${LATAM im pro services mgr rule}
    ${LATAM direct account oppty}       ${inf mgmt prof services product2}	    ${discount range}[0]    ${americas leader rule}	    ${LATAM im pro services mgr rule}