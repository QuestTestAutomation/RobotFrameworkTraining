*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${inf mgmt license product}          DB2-TOD-PB  #AAQ-KCE-PP     #QSE-KCE-PP    #APA-APP-PP

@{emea 30 to 60 rule approvers}      Marie Wycherley    Martina Kuecherer
&{emea 30 to 60 rule}                chain=Non-Standard T&Cs    rule=EMEA DD Payment Terms    approvers=@{emea 30 to 60 rule approvers}

@{amer 30 to 60 rule approvers}      Shannon Kekuna    Joann King    Amber Rickman
&{amer 30 to 60 rule}                chain=Non-Standard T&Cs    rule=AMER DD Payment Terms    approvers=@{amer 30 to 60 rule approvers}

@{more 60 rule approvers}            Bradley Zapalac
&{glob more 60 rule}                 chain=Non-Standard T&Cs    rule=Global IM Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

EMEA - IM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741023
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 45             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 60             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 50             ${emea 30 to 60 rule}

EMEA - IM - Extended Payment Terms - Net > 60
    [Tags]    C741022
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 90             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 65             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${inf mgmt license product}          Net 365            ${glob more 60 rule}


AMER - IM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741037
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 45              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 60              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 50              ${amer 30 to 60 rule}


AMER - IM - Extended Payment Terms - Net > 60
     [Tags]    C741036
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 90             ${glob more 60 rule}
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 65             ${glob more 60 rule}
    ${NAM direct account oppty}        ${inf mgmt license product}          Net 365            ${glob more 60 rule}
    