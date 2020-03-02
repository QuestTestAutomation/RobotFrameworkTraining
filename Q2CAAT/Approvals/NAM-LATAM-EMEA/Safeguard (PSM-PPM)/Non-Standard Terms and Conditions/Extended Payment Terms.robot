*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${oid safeguard license product}     SPS-SFG-PB-247    #SFM-SFG-PB-247

@{emea 30 to 60 rule approvers}      Marie Wycherley    Martina Kuecherer
&{emea 30 to 60 rule}                chain=Non-Standard T&Cs    rule=EMEA DD Payment Terms    approvers=@{emea 30 to 60 rule approvers}

@{amer 30 to 60 rule approvers}      Shannon Kekuna    Joann King    Amber Rickman
&{amer 30 to 60 rule}                chain=Non-Standard T&Cs    rule=AMER DD Payment Terms    approvers=@{amer 30 to 60 rule approvers}

@{more 60 rule approvers}            Danny Ward
&{glob more 60 rule}                 chain=Non-Standard T&Cs    rule=Global OI Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

EMEA - Safeguard (PSM-PPM) - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741030    
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 45             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 60             ${emea 30 to 60 rule}
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 50             ${emea 30 to 60 rule}

EMEA - Safeguard (PSM-PPM) - Extended Payment Terms - Net > 60
    [Tags]    C741031
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 90             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 65             ${glob more 60 rule}
    ${EMEA direct account oppty}        ${oid safeguard license product}          Net 365            ${glob more 60 rule}


AMER - Safeguard (PSM-PPM) - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741044
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 45              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 60              ${amer 30 to 60 rule}
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 50              ${amer 30 to 60 rule}


AMER - Safeguard (PSM-PPM) - Extended Payment Terms - Net > 60
     [Tags]    C741045
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                       |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 90             ${glob more 60 rule}
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 65             ${glob more 60 rule}
    ${NAM direct account oppty}        ${oid safeguard license product}          Net 365            ${glob more 60 rule}
    