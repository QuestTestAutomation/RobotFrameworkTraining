*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${one identity license product #1}     AAT-ATA-PB
${one identity license product #2}     AEM-DMX-TB-247
${one identity license product #3}     ENT-DMZ-CH    #QQA-EVI-PB
${one identity license product #4}     STD-DMZ-CH    #ABA-VNT-PB-247
@{30 to 60 rule approvers}             Marie Wycherley
&{apj 30 to 60 rule}                   chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}              Danny Ward
&{apj more 60 rule}                    chain=Non-Standard T&Cs    rule=Global OI Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - OI - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741014
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                             |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${one identity license product #1}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${one identity license product #2}          Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${one identity license product #3}          Net 50             ${apj 30 to 60 rule}

APJ - OI - Extended Payment Terms - Net > 60
    [Tags]    	C741015
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                              |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${one identity license product #3}          Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${one identity license product #4}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${one identity license product #2}          Net 365            ${apj more 60 rule}