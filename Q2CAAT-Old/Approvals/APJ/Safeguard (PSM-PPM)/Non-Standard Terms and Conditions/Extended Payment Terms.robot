*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${oid safeguard license}               DAX-BAL-PB-247    #AFT-SFG-TB-247    #SFM-SFG-PB-247   
@{30 to 60 rule approvers}             Marie Wycherley
&{apj 30 to 60 rule}                   chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}              Danny Ward
&{apj more 60 rule}                    chain=Non-Standard T&Cs    rule=Global OI Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - Safeguard (PSM-PPM) - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741016
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                     |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 50             ${apj 30 to 60 rule}

APJ - Safeguard (PSM-PPM) - Extended Payment Terms - Net > 60
    [Tags]    	C741017
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                     |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${oid safeguard license}          Net 365            ${apj more 60 rule}