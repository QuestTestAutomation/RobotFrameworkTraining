*** Settings ***
Documentation       Now Metalogix is a part of Platform Management. So discounts should be the same as Platform Management ones
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Sales Mgr Approval

*** Variables ***
@{discount range}                    15.01    30
${metalaogix license product #1}     SCC-MLX-PB-247    #SBU-MLX-PB    #AME-MLX-TB-247
${metalaogix license product #2}     REX-MLX-PB-247    #IMI-MLX-TB-247 
${metalaogix license product #3}     CMS-MLX-PB-NPN
@{approvers}                         David Stepancich
&{pm im rule}                        chain=Direct New Sale Discount    rule=Global Sales Manager Approval - PM    approvers=@{approvers}


*** Test Cases ***
Platform mgmt Metalogix Products - Region NAM and LATAM - More than 15% to 30% Discount- APPROVED BY Sales Manager /Country Manager / Director
    [Tags]    C408735
    ${NAM direct account oppty}       ${metalaogix license product #1}            ${discount range}[0]        ${pm im rule}
    ${EMEA direct account oppty}      ${metalaogix license product #2}            ${discount range}           ${pm im rule}
    ${LATAM direct account oppty}     ${metalaogix license product #3}            ${discount range}[1]        ${pm im rule}
    #LATAM does not contain Metagix products, third test is temporarily instead LATAM test
    #${LATAM direct account oppty}     ${metalaogix license product #1}            ${discount range}[1]        &{pm im rule}
