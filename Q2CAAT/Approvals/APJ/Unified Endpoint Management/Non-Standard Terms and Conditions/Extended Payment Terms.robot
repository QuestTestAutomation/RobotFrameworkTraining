*** Settings ***
Resource            ../../../Approvals Keywords.robot

Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create Quote with Extended Payment Terms and check approvals
Force Tags          non_standard_terms    extended_payment_terms

*** Variables ***
${uem kace portfolio license products}            RAP-RSC-PB    #DDB-SCL-PB, FFB-KCE-TB, AMF-KCE-TB, GFX-RSC-TB
${uem kace kaas license products}                 JAC-KCE-TL   #CAA-BAL-TB-247    #BYB-BAL-PB-247    #AFT-SFG-TB-247    #SFM-SFG-PB-247   
@{30 to 60 rule approvers}                        Marie Wycherley
&{apj 30 to 60 rule}                              chain=Non-Standard T&Cs    rule=APJ DD Payment Terms    approvers=@{30 to 60 rule approvers}

@{more 60 rule approvers}                         Carissa Kell
&{apj more 60 rule}                               chain=Non-Standard T&Cs    rule=Global UEM Finance Payment Terms    approvers=@{more 60 rule approvers}


*** Test Cases ***

APJ - UEM - Extended Payment Terms - 30 < Net < 60
    [Tags]    C741010
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${uem kace portfolio license products}          Net 45             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${uem kace kaas license products}               Net 60             ${apj 30 to 60 rule}
    ${APJ direct account oppty USD}     ${uem kace kaas license products}               Net 50             ${apj 30 to 60 rule}

APJ - UEM - Extended Payment Terms - Net > 60
    [Tags]    C741011
 #--------------------------------------------------------------------------------------------------------------------------
 #   Oppty                       `    |   Prodcuct                                   |  Payment Term    |  Rule
 #--------------------------------------------------------------------------------------------------------------------------
    ${APJ direct account oppty USD}     ${uem kace kaas license products}               Net 90             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${uem kace portfolio license products}          Net 65             ${apj more 60 rule}
    ${APJ direct account oppty USD}     ${uem kace kaas license products}               Net 365            ${apj more 60 rule}