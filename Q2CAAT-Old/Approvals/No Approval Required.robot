*** Settings ***
Resource            Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required

*** Variables ***
@{license discount range}                      0    15
@{ps discount range}                           0    20
${NAM direct account oppty}                    GB NAM Approvals TEST - EOG RESOURCES INC - Oppty
${EMEA direct account oppty}                   GB EMEA Approvals TEST - AMGB LTD - Oppty
${LATAM direct account oppty}                  GB LATAM Approvals TEST - EMPRESA BRASILEIRA DE TELECOMUNICAÇÕES SA - Oppty
${APJ direct account oppty}                    GB APJ Approvals - CHOSHI CITY - Oppty
${inf mgmt license product}                    DB2-TOD-PB
${platform mgmt license product}               SCP-SV3-PB-SRP
${data protection dl license product}          ADB-APP-PB-3YR
${data protection dr license product}          ABA-OCA-PB-247-3YR
${data protection kace license product}        KMM-KCE-PB    
${data protection rest dp license product}     MIB-APP-PB
${identity and sec mgmt license product}       ADN-PGO-PB


${inf mgmt prof services product}              TPC-TOD-PP
${platform mgmt prof services product}         GPH-DMX-CO
${data protection prof services product}       DAF-BKB-CO
${id and sec mgmt prof services product}       APM-DMX-PP


*** Test Cases ***
#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#
#    Test name                                                                          |   TC#     | Oppty                          |  Prodcuct                                     | Discount Range                 #
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    -#
#Information Mgmt. NAM Direct - New Sales On-Prem License                                  C313380    ${NAM direct account oppty}       ${inf mgmt license product}                      ${license discount range}[0]   
#Information Mgmt. EMEA Direct- New Sales On-Prem License                                  C313381    ${EMEA direct account oppty}      ${inf mgmt license product}                      ${license discount range}
#Information Mgmt. LATAM Direct - New Sales On-Prem License                                C313382    ${LATAM direct account oppty}     ${inf mgmt license product}                      ${license discount range}
#Information Mgmt. APJ Direct - New Sales On-Prem License                                  C313383    ${APJ direct account oppty}       ${inf mgmt license product}                      ${license discount range}[1]
#Platform Mgmt. NAM Direct - New Sales On-Prem License                                     C313396    ${NAM direct account oppty}       ${platform mgmt license product}                 ${license discount range}[0]
#Platform Mgmt. EMEA Direct - New Sales On-Prem License                                    C313397    ${EMEA direct account oppty}      ${platform mgmt license product}                 ${license discount range}
#Platform Mgmt. LATAM Direct - New Sales On-Prem License                                   C313398    ${LATAM direct account oppty}     ${platform mgmt license product}                 ${license discount range}
#Platform Mgmt. APJ Direct - New Sales On-Prem License                                     C313399    ${APJ direct account oppty}       ${platform mgmt license product}                 ${license discount range}[1]
#Data Protection NAM Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP)     C313412    ${NAM direct account oppty}       ${data protection dl license product}            ${license discount range}[0]
#Data Protection EMEA Direct - New Sales On-Prem License - DL and MD DL (SKUs with APP)    C313413    ${EMEA direct account oppty}      ${data protection dl license product}            ${license discount range}
#Data Protection LATAM Direct - New Sales On-Prem License - DL and MD DL(SKUs with APP)    C313414    ${LATAM direct account oppty}     ${data protection dl license product}            ${license discount range}
#Data Protection APJ - Direct New Sales On-Prem License - DL Series                        C313415    ${APJ direct account oppty}       ${data protection dl license product}            ${license discount range}[1]
#Data Protection NAM Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA)     C313428    ${NAM direct account oppty}       ${data protection dr license product}            ${license discount range}[0]
#Data Protection EMEA Direct - New Sales On-Prem License - DR and MD DR (SKUs with OCA)    C313429    ${EMEA direct account oppty}      ${data protection dr license product}            ${license discount range}
#Data Protection LATAM Direct- New Sales On-Prem License - DR and MD DR (SKUs with OCA)    C313430    ${LATAM direct account oppty}     ${data protection dr license product}            ${license discount range}
#Data Protection APJ Direct - New Sales On-Prem License - DR Series                        C313431    ${APJ direct account oppty}       ${data protection dr license product}            ${license discount range}[1]
#Data Protection NAM Direct - New Sales On-Prem License - KACE                             C313444    ${NAM direct account oppty}       ${data protection kace license product}          ${license discount range}[0]
#Data Protection EMEA Direct - New Sales On-Prem License - KACE                            C313445    ${EMEA direct account oppty}      ${data protection kace license product}          ${license discount range}
#Data Protection LATAM Direct - New Sales On-Prem License - KACE                           C313446    ${LATAM direct account oppty}     ${data protection kace license product}          ${license discount range}
#Data Protection APJ Direct - New Sales On-Prem License - KACE                             C313443    ${APJ direct account oppty}       ${data protection kace license product}          ${license discount range}[1]
#Data Protection NAM Direct - New Sales On-Prem License - Rest of DP Products              C313460    ${NAM direct account oppty}       ${data protection rest dp license product}       ${license discount range}[0]
#Data Protection EMEA Direct- New Sales On-Prem License - Rest of DP Products              C313461    ${EMEA direct account oppty}      ${data protection rest dp license product}       ${license discount range}
#Data Protection LATAM Direct - New Sales On-Prem License - Rest of DP Products            C313462    ${LATAM direct account oppty}     ${data protection rest dp license product}       ${license discount range}
#Data Protection APJ Direct - New Sales On-Prem License - Rest of DP Products              C313459    ${APJ direct account oppty}       ${data protection rest dp license product}       ${license discount range}[1]
#Identity and Security Mgmt. NAM Direct - New Sales On-Prem License - One Identity         C313476    ${NAM direct account oppty}       ${identity and sec mgmt license product}         ${license discount range}[0]
#Identity and Security Mgmt. EMEA - New Sales On-Prem License - One Identity               C313477    ${EMEA direct account oppty}      ${identity and sec mgmt license product}         ${license discount range}
#Identity and Security Mgmt. LATAM - New Sales On-Prem License - One Identity              C313478    ${LATAM direct account oppty}     ${identity and sec mgmt license product}         ${license discount range}
#Identity and Security Mgmt. APJ Direct - New Sales On-Prem License - One Identity         C313479    ${APJ direct account oppty}       ${identity and sec mgmt license product}         ${license discount range}[1]
#Information Mgmt. NAM Direct - Professional Services                                      C313508    ${NAM direct account oppty}       ${inf mgmt prof services product}                ${ps discount range}[0]
#Information Mgmt. LATAM Direct - Professional Services                                    C313510    ${LATAM direct account oppty}     ${inf mgmt prof services product}                ${ps discount range}
#Information Mgmt. APJ Direct - Professional Services                                      C313511    ${APJ direct account oppty}       ${inf mgmt prof services product}                ${ps discount range}
#Information Mgmt. EMEA Direct - Professional Services                                     C313509    ${EMEA direct account oppty}      ${inf mgmt prof services product}                ${ps discount range}[1]
#Platform Mgmt. NAM Direct - Professional Services                                         C313516    ${NAM direct account oppty}       ${platform mgmt prof services product}           ${ps discount range}[0]
#Platform Mgmt. EMEA Direct - Professional Services                                        C313517    ${EMEA direct account oppty}      ${platform mgmt prof services product}           ${ps discount range}
#Platform Mgmt. LATAM Direct - Professional Services                                       C313518    ${LATAM direct account oppty}     ${platform mgmt prof services product}           ${ps discount range}
#Platform Mgmt. APJ Direct - Professional Services                                         C313519    ${APJ direct account oppty}       ${platform mgmt prof services product}           ${ps discount range}[1]
#Data Protection NAM Direct - Professional Services                                        C313528    ${NAM direct account oppty}       ${data protection prof services product}         ${ps discount range}[0]
#Data Protection EMEA Direct - Professional Services                                       C313529    ${EMEA direct account oppty}      ${data protection prof services product}         ${ps discount range}
#Data Protection LATAM Direct Quote - Professional Services                                C313530    ${LATAM direct account oppty}     ${data protection prof services product}         ${ps discount range}[1]
#Identity and Security Mgmt. NAM Direct - Professional Services                            C313536    ${NAM direct account oppty}       ${id and sec mgmt prof services product}         ${ps discount range}[0]
#Identity and Security Mgmt. EMEA Direct- Professional Services                            C313537    ${EMEA direct account oppty}      ${id and sec mgmt prof services product}         ${ps discount range}
#Identity and Security Mgmt. LATAM Direct - Professional Services                          C313538    ${LATAM direct account oppty}     ${id and sec mgmt prof services product}         ${ps discount range}[1]

    
