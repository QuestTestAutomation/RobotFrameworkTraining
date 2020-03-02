*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${platform mgmt license product #1}      SCP-SV3-PB-SRP
${platform mgmt license product #2}      RCM-ATA-PB
${platform mgmt license product #3}      ACY-PAK-PB-SRP
${platform mgmt license product #4}      RCV-ATA-PB-5YR-247
@{30 to 60 rule approvers}               Marie Wycherley
&{apj 30 to 60 rule}                     chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}                Danny Ward
&{apj more 60 rule}                      chain=Non-Standard T&Cs    rule=Global PM Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - PM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741012
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                             |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${platform mgmt license product #1}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${platform mgmt license product #2}          Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${platform mgmt license product #3}          Net 50             ${apj 30 to 60 rule}

APJ - PM - Extended Payment Terms - Net > 60
    [Tags]    	C741013
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                              |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${platform mgmt license product #4}          Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${platform mgmt license product #3}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${platform mgmt license product #1}          Net 365            ${apj more 60 rule}