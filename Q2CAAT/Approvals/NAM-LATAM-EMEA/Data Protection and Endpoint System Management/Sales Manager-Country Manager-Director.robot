*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range}                              15.01    30
@{channel discount range}                      00.01    9.99
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        MMA-KCE-PB-3YR     #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protection dl addons}                   AAQ-APP-CB-247-4HR
${data protection dr addons}                   MDA-OCA-PB-3YR
@{americas approvers}                          David Stepancich    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
@{emea approvers}                              David Stepancich    #Kevin Stanton	Brad Gardiner
&{americas mgr rule}                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP	        approvers=@{americas approvers}
&{emea mgr rule}                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP	        approvers=@{emea approvers}
&{channel americas mgr rule}                   chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP	approvers=@{americas approvers}
&{channel emea mgr rule}                       chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP	approvers=@{emea approvers}


*** Test Cases ***
Data Protection NAM Direct Quote - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 15% to 30% Discount - APPROVER IS SALES REP MGR
    [Tags]    C313416
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[0]        ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}           ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[1]        ${americas mgr rule}
    
Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 15% to 30% Discount- APPROVED BY SALES REP MANAGER
    [Tags]    C313417
    ${EMEA direct account oppty}       ${data protection dl license product}            ${discount range}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}       ${data protection dl license product}            ${discount range}           ${emea mgr rule}
    ${EMEA direct account oppty}       ${data protection dl license product}            ${discount range}[1]        ${emea mgr rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 15% to 30% Discount-APPROVER IS SALES REP MGR
    [Tags]    C313418
    ${LATAM direct account oppty}       ${data protection dl license product}            ${discount range}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}       ${data protection dl license product}            ${discount range}           ${americas mgr rule}
    ${LATAM direct account oppty}       ${data protection dl license product}            ${discount range}[1]        ${americas mgr rule}

Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 15% to 30% Discount - APPROVER IS SALES REP MGR
    [Tags]    C313432
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}[0]        ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}           ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}[1]        ${americas mgr rule}

Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 15% to 30% Discount- APPROVED BY SALES REP MANAGER
    [Tags]    C313433
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}           ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}[1]        ${emea mgr rule}

Data Protection LATAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 15% to 30% Discount-APPROVER IS SALES REP MGR
    [Tags]    C313434   
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}           ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}[1]        ${americas mgr rule}

 
Data Protection NAM Direct - New Sales On-Prem License - Rest of DP Products - More than 15% to 30% Discount - APPROVER IS SALES REP MGR
    [Tags]    C313464 
    ${NAM direct account oppty}       ${data protection rest dp license product}          ${discount range}[0]        ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}          ${discount range}           ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}          ${discount range}[1]        ${americas mgr rule}    
 
Data Protection EMEA Direct - New Sales On-Prem License - Rest of DP Products - More than 15% to 30% Discount- APPROVED BY SALES REP MANAGER
    [Tags]    C313465
    ${EMEA direct account oppty}      ${data protection rest dp license product}          ${discount range}[0]        ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}          ${discount range}           ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}          ${discount range}[1]        ${emea mgr rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - Rest of DP Products - More than 15% to 30% Discount-APPROVER IS SALES REP MGR
    [Tags]    C313466
    ${LATAM direct account oppty}     ${data protection rest dp license product}          ${discount range}[0]        ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection rest dp license product}          ${discount range}           ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection rest dp license product}          ${discount range}[1]        ${americas mgr rule}

Data Protection LATAM Channel - New Sales On-Prem License - less than 10% -APPROVER IS SALES REP MGR    
    [Tags]    C313502
    ${LATAM channel account oppty}    ${data protection rest dp license product}          ${channel discount range}[0]		${channel americas mgr rule}
    ${LATAM channel account oppty}    ${data protection rest dp license product}          ${channel discount range}	        ${channel americas mgr rule}
    ${LATAM channel account oppty}    ${data protection rest dp license product}          ${channel discount range}[1]	    ${channel americas mgr rule}
    