*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${data protection product}           MIB-APP-PB    #AAQ-KCE-PP     #QSE-KCE-PP    #APA-APP-PP

@{emea 30 to 60 rule approvers}      Marie Wycherley    Martina Kuecherer
&{emea 30 to 60 rule}                chain=Non-Standard T&Cs    rule=EMEA DD Payment Terms    approvers=@{emea 30 to 60 rule approvers}

@{amer 30 to 60 rule approvers}      Shannon Kekuna    Joann King    Amber Rickman
&{amer 30 to 60 rule}                chain=Non-Standard T&Cs    rule=AMER DD Payment Terms    approvers=@{amer 30 to 60 rule approvers}

@{more 60 rule approvers}            Gary Rigsby
&{glob more 60 rule}                 chain=Non-Standard T&Cs    rule=Global DP Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

EMEA - DP - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741020
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${data protection product}          Net 45             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${data protection product}          Net 60             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${data protection product}          Net 50             ${emea 30 to 60 rule}

EMEA - DP - Extended Payment Terms - Net > 60
    [Tags]    C741021
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${data protection product}          Net 90             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${data protection product}          Net 65             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${data protection product}          Net 365            ${glob more 60 rule}


AMER - DP - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741034
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${data protection product}          Net 45              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${data protection product}          Net 60              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${data protection product}          Net 50              ${amer 30 to 60 rule}


AMER - DP - Extended Payment Terms - Net > 60
     [Tags]    C741035
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${data protection product}          Net 90             ${glob more 60 rule}
    ${NAM direct account oppty}        ${data protection product}          Net 65             ${glob more 60 rule}
    ${NAM direct account oppty}        ${data protection product}          Net 365            ${glob more 60 rule}
    