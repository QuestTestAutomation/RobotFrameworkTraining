*** Settings ***
Resource            ../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Leader Approval, Director Approval and DealDesk Approval

*** Variables ***
@{discount range}                              50.01    100
@{discount range 2}                            60.01    100
@{channel discount range 2}	                   20	    100
${data protection dl Hardware Expansion}       ARB-APP-CB-247-NBD-3YR    #ADB-APP-PB-3YR
${data protection dr Hardware Expansion}       EOS-OCA-PB-3YR    #SOZ-OCA-PB-3YR    #ABA-OCA-PB-247-3YR
${data protection kace license product}        MMA-KCE-PB-3YR     #KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${data protection dl addons}                   AAQ-APP-CB-247-4HR
${data protection dr addons}                   AAC-OCA-PB-3YR
@{americas approvers}                          David Stepancich    #Kevin Schwarzkopf    Josh Paez    Adam Hall    Dylan Schadegg    Marco Fontenelle
@{emea approvers}                              David Stepancich    #Kevin Stanton	Brad Gardiner
&{americas mgr rule}                           chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP	            approvers=@{americas approvers}
&{channel americas mgr rule}                   chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP	    approvers=@{americas approvers}
&{emea mgr rule}                               chain=Direct New Sale Discount    rule=Global Sales Manager Approval - DP	            approvers=@{emea approvers}
&{channel emea mgr rule}                       chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - DP	    approvers=@{emea approvers}
@{AMER leader approvers}                       Robert Adams
&{AMER step 3 rule}                            chain=Direct New Sale Discount    rule=AMER DP Sales Leader Approval	                    approvers=@{AMER leader approvers}
&{channel AMER step 3 rule}                    chain=Channel New Sale Discount   rule=AMER DP Sales Leader Approval - Channel Discount	approvers=@{AMER leader approvers}
@{EMEA leader approvers}                       Brad Gardiner
&{EMEA step 3 rule}                            chain=Direct New Sale Discount    rule=EMEA DP Sales Leader Approval	                    approvers=@{EMEA leader approvers}
&{channel EMEA step 3 rule}                    chain=Channel New Sale Discount   rule=EMEA DP Sales Leader Approval - Channel Discount	approvers=@{EMEA leader approvers}
@{AMER DealDesk approvers}                            Shannon Kekuna
                                               ...    Joann King
                                               ...    Amber Rickman
&{AMER step 4 rule}                            chain=Direct New Sale Discount    rule=AMER DD Approval - Direct Discount	            approvers=@{AMER DealDesk approvers}
&{channel AMER step 4 rule}                    chain=Channel New Sale Discount   rule=AMER DD Approval - Channel Discount	            approvers=@{AMER DealDesk approvers}
@{EMEA DealDesk approvers}                            Martina Kuecherer
                                               ...    Marie Wycherley
                                               ...    Marnie Caddle
&{EMEA step 4 rule}                            chain=Direct New Sale Discount    rule=EMEA DD Approval - Direct Discount	            approvers=@{EMEA DealDesk approvers}
&{EMEA step 4 rule}                            chain=Channel New Sale Discount   rule=EMEA DD Approval - Channel Discount	            approvers=@{EMEA DealDesk approvers}


*** Test Cases ***
Data Protection NAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Appliance Solutions - More than 50% Discount
    [Tags]    C313424
    ${NAM direct account oppty}       ${data protection dl Hardware Expansion}            ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection dl Hardware Expansion}            ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection dl Hardware Expansion}            ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}

Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Add Ons - More than 50%
    [Tags]    C313425
    ${EMEA direct account oppty}      ${data protection dl Hardware Expansion}            ${discount range}[0]       ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection dl Hardware Expansion}            ${discount range}          ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection dl Hardware Expansion}            ${discount range}[1]       ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP) Add Ons - More than 50%
    [Tags]    C313426
    ${LATAM direct account oppty}     ${data protection dl Hardware Expansion}            ${discount range}[0]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${data protection dl Hardware Expansion}            ${discount range}         ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${data protection dl Hardware Expansion}            ${discount range}[1]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}

Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 50% Discount
    [Tags]    C313440
    ${NAM direct account oppty}       ${data protection dr Hardware Expansion}          ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection dr Hardware Expansion}          ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection dr Hardware Expansion}          ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}

Data Protection LATAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Appliance Solutions - More than 50% Discount - APPROVER IS Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C313442   
    ${LATAM direct account oppty}     ${data protection dr Hardware Expansion}          ${discount range}[0]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${data protection dr Hardware Expansion}          ${discount range}           ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${LATAM direct account oppty}     ${data protection dr Hardware Expansion}          ${discount range}[1]        ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}

Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA) Add Ons - More than 50%
    [Tags]    C401824
    ${EMEA direct account oppty}      ${data protection dr Hardware Expansion}          ${discount range}[0]        ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection dr Hardware Expansion}          ${discount range}           ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection dr Hardware Expansion}          ${discount range}[1]        ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}

Data Protection NAM Direct - New Sales On-Prem License - Rest of DP Products - More than 60% Discount - DEAL DESK
    [Tags]    C313472 
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[0]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}         ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[1]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}    
 
Data Protection EMEA Direct - New Sales On-Prem License - Rest of DP Products - More than 60% Discount - DEAL DESK
    [Tags]    C313473
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}[0]      ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}         ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    ${EMEA direct account oppty}      ${data protection rest dp license product}     ${discount range 2}[1]      ${EMEA step 3 rule}    ${emea mgr rule}    ${EMEA step 4 rule}
    
Data Protection LATAM Direct - New Sales On-Prem License - Rest of DP Products - More than 60% Discount - DEAL DESK
    [Tags]    C313474
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[0]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}         ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}
    ${NAM direct account oppty}       ${data protection rest dp license product}     ${discount range 2}[1]      ${AMER step 3 rule}    ${americas mgr rule}    ${AMER step 4 rule}

Data Protection NAM Channel Quote Discount- Incremental discounts of 20% or greater - APPROVER is DEAL DESK along with Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313556 
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[0]      ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}         ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}
    ${NAM channel account oppty}      ${data protection rest dp license product}     ${channel discount range 2}[1]      ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}    

Data Protection LATAM Channel Quote Discount- Incremental discounts of 20% or greater - APPROVER is DEAL DESK along with Sales Manager/Country Manager, Regional Business Unit Sales Leader
    [Tags]    C313558   
    ${LATAM channel account oppty}    ${data protection rest dp license product}     ${channel discount range 2}[0]        ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}
    ${LATAM channel account oppty}    ${data protection rest dp license product}     ${channel discount range 2}           ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}
    ${LATAM channel account oppty}    ${data protection rest dp license product}     ${channel discount range 2}[1]        ${channel AMER step 3 rule}    ${channel americas mgr rule}    ${channel AMER step 4 rule}
            