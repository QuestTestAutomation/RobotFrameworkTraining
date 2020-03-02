*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${inf mgmt license product #1}       DB2-TOD-PB
${inf mgmt license product #2}       AAT-FOG-TL 
${inf mgmt license product #3}       IAC-IMC-PB-NPN
@{30 to 60 rule approvers}           Marie Wycherley
&{apj 30 to 60 rule}                 chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}            Bradley Zapalac
&{apj more 60 rule}                  chain=Non-Standard T&Cs    rule=Global IM Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - IM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741009
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                         |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${inf mgmt license product #1}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${inf mgmt license product #2}          Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${inf mgmt license product #3}          Net 50             ${apj 30 to 60 rule}

APJ - IM - Extended Payment Terms - Net > 60
    [Tags]    C741008
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                          |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${inf mgmt license product #1}          Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${inf mgmt license product #2}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${inf mgmt license product #3}          Net 365            ${apj more 60 rule}