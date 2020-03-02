*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval and Director Approval

*** Variables ***
@{discount range}                              30.01    50
@{discount range 2}                            30.01    60
@{channel discount range 2}                    10    	19.99
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        MMA-KCE-PB-3YR     #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protection dl addons}                   AAQ-APP-CB-247-4HR
${data protection dr addons}                   MDA-OCA-PB-3YR
@{americas approvers}                          David Stepancich    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
@{emea approvers}                              David Stepancich    #Kevin Stanton	Brad Gardiner
&{americas mgr rule}                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP                approvers=@{americas approvers}
&{channel americas mgr rule}                   chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP                approvers=@{americas approvers}
&{emea mgr rule}                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP                approvers=@{emea approvers}
&{channel emea mgr rule}                       chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP                approvers=@{emea approvers}
@{AMER leader approvers}                       Robert Adams
&{AMER step 3 rule}                            chain=Direct New Sale Discount    rule=AMER DP Sales Leader Approval	                    approvers=@{AMER leader approvers}
&{channel AMER step 3 rule}                    chain=Channel New Sale Discount   rule=AMER DP Sales Leader Approval - Channel Discount	approvers=@{AMER leader approvers}
@{EMEA leader approvers}                       Brad Gardiner
&{EMEA step 3 rule}                            chain=Direct New Sale Discount    rule=EMEA DP Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                    chain=Channel New Sale Discount   rule=EMEA DP Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}


*** Test Cases ***
Data Protection NAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313420
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dl license product}            ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}
    
Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313421
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}[0]       ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}          ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dl license product}            ${discount range}[1]       ${EMEA step 3 rule}    ${emea mgr rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313422
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}[0]      ${AMER step 3 rule}    ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}         ${AMER step 3 rule}    ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dl license product}            ${discount range}[1]      ${AMER step 3 rule}    ${americas mgr rule}

Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313436
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection dr license product}          ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}

Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313437
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}[0]        ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}           ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection dr license product}          ${discount range}[1]        ${EMEA step 3 rule}    ${emea mgr rule}

Data Protection LATAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 30% to 50% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313438   
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}
    ${LATAM direct account oppty}     ${data protection dr license product}          ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}

 
Data Protection NAM Direct - New Sales On-Prem License - Rest of DP Products - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313468 
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[0]      ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}         ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[1]      ${AMER step 3 rule}    ${americas mgr rule}    
 
Data Protection EMEA Direct - New Sales On-Prem License - Rest of DP Products - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313469
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}[0]      ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}         ${EMEA step 3 rule}    ${emea mgr rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}[1]      ${EMEA step 3 rule}    ${emea mgr rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - Rest of DP Products - More than 30% to 60% Discount - APPROVER IS Regional Business Unit Sales Leader
    [Tags]    C313470
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[0]      ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}         ${AMER step 3 rule}    ${americas mgr rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[1]      ${AMER step 3 rule}    ${americas mgr rule}

Data Protection NAM Channel - New Sales On-Prem License - Incremental discounts from 10% to less than 20% - Approvals should be sent to Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313500 
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[0]      ${channel AMER step 3 rule}    ${channel americas mgr rule}
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}         ${channel AMER step 3 rule}    ${channel americas mgr rule}
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[1]      ${channel AMER step 3 rule}    ${channel americas mgr rule}    

Data Protection EMEA Channel - New Sales On-Prem License - NEED DISCOUNT % & APPROVER  
    [Tags]    C313501
    ${EMEA channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[0]      ${channel EMEA step 3 rule}    ${channel emea mgr rule}
    ${EMEA channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}         ${channel EMEA step 3 rule}    ${channel emea mgr rule}
    ${EMEA channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[1]      ${channel EMEA step 3 rule}    ${channel emea mgr rule}
      