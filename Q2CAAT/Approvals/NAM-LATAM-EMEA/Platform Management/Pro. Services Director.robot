*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                              20.01    31.00
${platform mgmt prof services product}         GPH-DMX-CO    #WWB-SCL-PP    #DAF-BKB-CO
${platform mgmt prof services product 2}       EMC-ATA-CO
@{americas approvers}                          Joshua Shannon    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
@{emea approvers}                              Ian Simpson    #Kevin Stanton	Brad Gardiner
&{americas director rule}                           chain=Direct PS Sale Discount    rule=AMER PM Pro Services Director Approval    approvers=@{americas approvers}
&{emea director rule}                               chain=Direct PS Sale Discount    rule=EMEA PM Pro Services Director Approval    approvers=@{emea approvers}
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

Platform Mgmt. NAM Direct - Professional Services - More than 20% to 31% Discount - APPROVER IS Pro. Services Director  
    [Tags]   C313520 
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}[0]     ${americas director rule}    ${NAM pm pro services mgr rule}
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}        ${americas director rule}    ${NAM pm pro services mgr rule}
    ${NAM direct account oppty}         ${platform mgmt prof services product}          ${discount range}[1]     ${americas director rule}    ${NAM pm pro services mgr rule}
    
 
Platform Mgmt. EMEA Direct - Professional Services - More than 20% to 31% Discount - APPROVER IS Pro. Services Director 
    [Tags]     C313521
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}[0]    ${emea director rule}        ${EMEA pm pro services mgr rule}
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}       ${emea director rule}        ${EMEA pm pro services mgr rule}
    ${EMEA direct account oppty}        ${platform mgmt prof services product}          ${discount range}[1]    ${emea director rule}        ${EMEA pm pro services mgr rule}
    
    
Platform Mgmt. LATAM Direct Quote - Professional Services - More than 20% to 31% Discount - APPROVER IS Pro. Services Director
    [Tags]     C313522
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                     |  discount range USD
 #--------------------------------------------------------------------------------------------------------------------------    
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}        ${discount range}[1]    ${americas director rule}    ${LATAM pm pro services mgr rule}
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}        ${discount range}       ${americas director rule}    ${LATAM pm pro services mgr rule}
    ${LATAM direct account oppty}       ${platform mgmt prof services product 2}        ${discount range}[0]    ${americas director rule}    ${LATAM pm pro services mgr rule}