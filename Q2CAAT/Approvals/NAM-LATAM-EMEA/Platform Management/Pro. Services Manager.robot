*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range}                           0.01    20
${platform mgmt prof services product}      GPH-DMX-CO
${platform mgmt prof services product 2}    EMC-ATA-CO
@{NAM pm pro services mgr rule approvers}	       Armando Lio
                                            ...    Joshua Shannon
                                            ...    Allison Inouye
                                            ...    Ara Carter
                                            ...    Jason Scott
                                            ...    Gail Coulthard
                                            ...    Rogerio Soares
&{NAM pm pro services mgr rule}	            chain=Direct PS Sale Discount    rule=AMER PM Pro Services Manager Approval	        approvers=@{NAM pm pro services mgr rule approvers}
@{LATAM pm pro services mgr rule approvers}	Rogerio Soares
&{LATAM pm pro services mgr rule}	        chain=Direct PS Sale Discount    rule=LATAM Quest Pro Services Manager Approval	    approvers=@{LATAM pm pro services mgr rule approvers}
@{EMEA pm pro services mgr rule approvers}	       Farooq Hussain
	                                        ...    John Coady
	                                        ...    Rupert Miller
	                                        ...    Wiebke Dautert
	                                        ...    William Barfoot
	                                        ...    Phil Welsh
	                                        ...    Ales Zeman
	                                        ...    Joel Chenelat
	                                        ...    Pablo Sanchez
&{EMEA pm pro services mgr rule}	        chain=Direct PS Sale Discount    rule=EMEA PM Pro Services Manager Approval	        approvers=@{EMEA pm pro services mgr rule approvers}


*** Test Cases ***

Platform Mgmt. NAM Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required 
    [Tags]    C313516 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}[0]        ${NAM pm pro services mgr rule}  
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}           ${NAM pm pro services mgr rule}
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}[1]        ${NAM pm pro services mgr rule}
    
 
Platform Mgmt. EMEA Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required 
    [Tags]     C313517
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}[0]        ${EMEA pm pro services mgr rule}
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}           ${EMEA pm pro services mgr rule}
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}[1]        ${EMEA pm pro services mgr rule}
    
    
Platform Mgmt. LATAM Direct - Professional Services - Up to 20% Discount- Auto Approved- No approval required
    [Tags]     C313518
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                               |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}          ${discount range}[1]      ${LATAM pm pro services mgr rule}  
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}          ${discount range}         ${LATAM pm pro services mgr rule}
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}          ${discount range}[0]      ${LATAM pm pro services mgr rule}