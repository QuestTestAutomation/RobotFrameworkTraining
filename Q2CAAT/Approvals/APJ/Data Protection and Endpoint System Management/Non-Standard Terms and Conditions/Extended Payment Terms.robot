*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${data protection product}        PMP-BAK-CO    #APC-SCL-CO    #AAQ-KCE-PP     #QSE-KCE-PP    #APA-APP-PP
@{30 to 60 rule approvers}        Marie Wycherley
&{apj 30 to 60 rule}              chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}         Gary Rigsby
&{apj more 60 rule}               chain=Non-Standard T&Cs    rule=Global DP Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - DP - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741006
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${data protection product}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${data protection product}          Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${data protection product}          Net 50             ${apj 30 to 60 rule}

APJ - DP - Extended Payment Terms - Net > 60
    [Tags]    C741007
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${data protection product}          Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${data protection product}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${data protection product}          Net 365            ${apj more 60 rule}