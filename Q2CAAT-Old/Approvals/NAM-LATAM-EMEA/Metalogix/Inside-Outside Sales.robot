*** Settings ***
Documentation       Now Metalogix is a part of Platform Management. So discounts should be the same as Platform Management ones
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with No Approval Required


*** Variables ***
@{discount range}                    0    15
${metalaogix license product #1}     CPO-MLX-PB    #AME-MLX-TB-247
${metalaogix license product #2}     IMI-MLX-TB-247 

*** Test Cases ***


Platform mgmt Metalogix Products - Region NAM and LATAM - up to 10% NO APPROVAL REQUIRED
    [Tags]    C408734
 #--------------------------------------------------------------------------------------------------------------------------
 # Oppty                       `        |   Prodcuct                               |  Discount Range
 #--------------------------------------------------------------------------------------------------------------------------
     ${NAM direct account oppty}          ${metalaogix license product #1}             ${discount range}[0]
     ${EMEA direct account oppty}         ${metalaogix license product #2}             ${discount range}
     ${NAM direct account oppty}          ${metalaogix license product #1}             ${discount range}[1]
