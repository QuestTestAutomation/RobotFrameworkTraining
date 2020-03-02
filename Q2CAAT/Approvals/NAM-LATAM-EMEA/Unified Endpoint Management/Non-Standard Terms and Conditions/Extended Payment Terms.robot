*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${uem kace portfolio license products}            DDB-SCL-PB, RAP-RSC-PB, GFX-RSC-TB

@{emea 30 to 60 rule approvers}      Marie Wycherley    Martina Kuecherer
&{emea 30 to 60 rule}                chain=Non-Standard T&Cs    rule=EMEA DD Payment Terms    approvers=@{emea 30 to 60 rule approvers}

@{amer 30 to 60 rule approvers}      Shannon Kekuna    Joann King    Amber Rickman
&{amer 30 to 60 rule}                chain=Non-Standard T&Cs    rule=AMER DD Payment Terms    approvers=@{amer 30 to 60 rule approvers}

@{more 60 rule approvers}            Carissa Kell
&{glob more 60 rule}                 chain=Non-Standard T&Cs    rule=Global UEM Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

EMEA - UEM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741024    
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 45             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 60             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 50             ${emea 30 to 60 rule}

EMEA - UEM - Extended Payment Terms - Net > 60
    [Tags]    C741025
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 90             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 65             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${uem kace portfolio license products}          Net 365            ${glob more 60 rule}


AMER - UEM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741039
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 45              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 60              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 50              ${amer 30 to 60 rule}


AMER - UEM - Extended Payment Terms - Net > 60
     [Tags]    C741038
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 90             ${glob more 60 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 65             ${glob more 60 rule}
    ${NAM direct account oppty}        ${uem kace portfolio license products}          Net 365            ${glob more 60 rule}
    