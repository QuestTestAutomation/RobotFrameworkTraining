*** Settings ***
Resource         ../Resources/Commons/Global Setup.robot
Resource         ../Resources/SFDC POM/Login/Login.robot
Resource         ../Resources/SFDC POM/Classic POM/Common Elements/Details Page.robot
Resource         ../Resources/SFDC POM/SFDC Navigation/Search and Open SFDC Objects.robot
Resource         ../Resources/SFDC POM/Classic POM/Opportunities/Oppties Validations.robot
Resource         ../Resources/SFDC POM/Classic POM/Quotes/Quote Operations.robot
Resource         ../Resources/SFDC POM/Classic POM/Quote Lines/Quote Lines Operations.robot
Resource         ../Resources/SFDC POM/Classic POM/Quote Lines/Quote Lines Validations.robot
Resource         ../Resources/SFDC POM/Classic POM/Common Elements/Cloud Attachments.robot
Resource         ../Resources/Commons/SFDC Common Variables.robot
Resource         ../Resources/SFDC POM/Classic POM/Common Elements/Generate Document.robot
Suite Setup      Suite Setup
Test Setup       Login To SFDC sandbox
Test Teardown    Test Teardown

*** Test Cases ***
Manual Quote Creation
    [Documentation]    *Use Case ID:* Q4.1
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...    
    
    [Tags]  C315423
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Check property 'Stage' of Oppty '${TEST_OPPTY}' is NOT LIKE 'Closed Won'
    Check property 'Stage' of Oppty '${TEST_OPPTY}' is NOT LIKE 'Booked'
    Create Quote for Oppty '${TEST_OPPTY}'
    Validate Quote Name for Account '${TEST_ACCOUNT}'
    Check Quote Start Day is Today
    Check Quote Effective Through End Date is to '30' from Start Date
    Quote Property 'Opportunity' should conatin '${TEST_OPPTY}'
    Quote Property 'Account' should conatin '${TEST_ACCOUNT}'
    Quote Property 'Primary Contact' should conatin '${TEST_CONTACT}'
    Quote Property 'Opportunity RTM' should conatin 'Direct'
    Quote Property 'Business Unit' should conatin 'Quest'
    Quote Property 'Owner' should conatin '&{SF_USER}[display_name]'
    Quote Property 'Quote Source' should conatin 'Direct'
    Quote Property 'Status' should conatin 'Draft'
    Quote Property 'Price Book' should conatin 'NAM USD RETAIL PRICING'
    Quote Currency fields should contain 'USD'
    Quote 'Primary' Checkbox is 'Not Checked'
    Quote Property 'Bill To Account' should conatin '${TEST_ACCOUNT}'
    Property 'Bill To Contact' from IFrame with 'vpp' in ID should contain '${TEST_CONTACT}'
    Quote Property 'Ship To Account' should conatin '${TEST_ACCOUNT}'
    Property 'Ship To Contact' from IFrame with 'vpq' in ID should contain '${TEST_CONTACT}'
    Quote Property 'Bill To Account' should conatin '${TEST_ACCOUNT}'
    Quote Property 'End User Account' should conatin '${TEST_ACCOUNT}'
    Property 'End User Contact' from IFrame with 'vpo' in ID should contain '${TEST_CONTACT}'
    Quote Property 'Payment Terms' should conatin 'Net 30'

Payment Method for quote
    [Documentation]        *Use Case ID:* Q4.1.3
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...    
    [Tags]    C315427
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Quote Property 'Payment Terms' should conatin 'Net 30'
    Go To Edit Quote screen
    Select value 'Net 90' for property 'Payment Terms' from section 'Bill To'
    Save Quote
    Quote Property 'Payment Terms' should conatin 'Net 90'
    
Associate Ship to Account and Ship to Contact
    [Documentation]        *Use Case ID:* Q4.1.47
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...
    [Tags]    C313803    C313806
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Go To Edit Quote screen
    Lookup '${CHANGE_TO_TEST_ACCOUNT}' for 'Ship To Account' from section 'Ship To Information'
    Lookup '${CHANGE_TO_TEST_CONTACT}' for 'Ship To Contact' from section 'Ship To Information'
    Save Quote
    Quote Property 'Ship To Account' should conatin '${CHANGE_TO_TEST_ACCOUNT}'
    Quote Property 'Ship To Contact' should conatin '${CHANGE_TO_TEST_CONTACT}'
    
Associate End User Account and End User Contact
    [Documentation]        *Use Case ID:* Q4.1.45
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...
    [Tags]    C313804    C313801
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Go To Edit Quote screen
    Lookup '${CHANGE_TO_TEST_ACCOUNT}' for 'End User Account' from section 'End User Information'
    Lookup '${CHANGE_TO_TEST_CONTACT}' for 'End User Contact' from section 'End User Information'
    Save Quote
    Quote Property 'End User Account' should conatin '${CHANGE_TO_TEST_ACCOUNT}'
    Quote Property 'End User Contact' should conatin '${CHANGE_TO_TEST_CONTACT}'
    
Associate Bill To Account and Bill To Contact
    [Documentation]        *Use Case ID:* Q4.1.46
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...
    [Tags]    C313805
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Go To Edit Quote screen
    Lookup '${CHANGE_TO_TEST_ACCOUNT}' for 'Bill To Account' from section 'Bill To'
    Lookup '${CHANGE_TO_TEST_CONTACT}' for 'Bill To Contact' from section 'Bill To'
    Save Quote
    Quote Property 'Bill To Account' should conatin '${CHANGE_TO_TEST_ACCOUNT}'
    Quote Property 'Bill To Contact' should conatin '${CHANGE_TO_TEST_CONTACT}'
    
Quote Totals
    [Documentation]        *Use Case ID:* Q4.1.34
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...
    [Tags]    C313790
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Add products to Quote by Product Codes	DB2-TOD-PB
    Quote Lines Should Contain Product Codes    DB2-TOD-PB
    ${tax amount}=    Get Tax Info
    Open Quote Line for 'DB2-TOD-PB'
    'Quote Line' property 'List Total' should conatin 'USD 1,002.75'
    'Quote Line' property 'Total Discount (%)' should conatin '0.000%'
    'Quote Line' property 'Total Discount (Amt)' should conatin 'USD 0.00'
    'Quote Line' property 'Net Total' should conatin 'USD 1,002.75'
    'Quote Line' property 'Tax Amount' should conatin 'USD 97.77'

Purchase Order number for quote
    [Documentation]        *Use Case ID:* Q4.1.4
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...    
    [Tags]    C313771
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Go To Edit Quote screen
    Enter value '${LONG PO NUMBER}' in 'PO Number' text box
    Save Quote
    Go To Edit Quote screen
    Scroll 'PO Number' into view
    ${actual PO Number}    Get current value of 'PO Number' text box
    Should Be Equal As Strings    ${actual PO Number}    ${LONG PO NUMBER}    msg=PO Number mismatch

Capture line type for each quote line
    [Documentation]        *Use Case ID:* Q4.1.4
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...    
    [Tags]    C313777
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Add products to Quote by Product Codes	DB2-TOD-PB
    Quote Lines Should Contain Product Codes    DB2-TOD-PB
    Open Quote Line for 'DB2-TOD-PB'
    'Quote Line' property 'Quote Line Type' should conatin 'Perpetual License/Maint.'
    

Additional email address addition to quote
    [Documentation]        *Use Case ID:* Q4.1.87
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2562
    ...    
    ...    *JIRA Story:* https://jira.labs.quest.com/browse/ITQTC-2489
    ...    
    [Tags]    C313837
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Go To Edit Quote screen
    Enter value '${10 mail boxes}' in 'Additional Email' text box
    Save Quote
    Quote Property 'Additional Email' should conatin '${10 mail boxes}'

Verify Sales rep is able to edit Quantity from configurator screen on quote line
    [Documentation]        *Use Case ID:* Q4.1.15
    [Tags]    C313779
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    #Go To Configure Products Page
    Add product to Quote with Quatntity    AAA-WGA-PB    123
    Quote Total Should Be 'USD 1,230.00'
    Save Products
    Quote Line for 'AAA-WGA-PB' Should Contian '123.00' Quantity
    Quote Line for 'AAA-WGA-PB' Should Contian 'USD 1,230.00' Net Total

Subscription section Start Date and End Date on Quote Line
    [Documentation]        *Use Case ID:* Q4.1.17
    [Tags]      C313781
    Open 'Opportunity' with name '${TEST_OPPTY}'
    Create Quote for Oppty '${TEST_OPPTY}'
    Add products to Quote by Product Codes	DB2-TOD-PB
    Open Quote Line for 'DB2-TOD-PB'
    Property 'Effective Start Date' of section 'Subscription Information' is NOT EMPTY
    Property 'Effective End Date' of section 'Subscription Information' is NOT EMPTY
    Check Quote Line 'Effective Start Date' is Today
    Check Quote Line 'Effective End Date' from 'Subscription Information' is to '365' days from 'Effective Start Date'
    Check Quote Line 'End Date' from 'Subscription Information' is to '365' days from 'Start Date'

Referral % for quotes
   [Documentation]        *Use Case ID:* Q4.3.1
   [Tags]      C313846
   Open 'Opportunity' with name '${TEST_OPPTY_CHANNEL}'
   Create Quote for Oppty '${TEST_OPPTY_CHANNEL}'
   Go To Edit Quote screen
   Enter value '15' in 'Referral %' text box
   Save Quote
   Quote Property 'Referral %' should conatin '15.00%'

Traditional (non-guided) Selling
   [Documentation]        *Use Case ID:* Q4.1.10
   [Tags]      C313774
   Open 'Opportunity' with name '${TEST_OPPTY}'
   Create Quote for Oppty '${TEST_OPPTY}'
   #Go To Configure Products Page
   Add products to Quote by Product Codes	DB2-TOD-PB
   Quote Lines Should Contain Product Codes    DB2-TOD-PB

Cloud Attachments for Direct Quote
   [Documentation]        *Use Case ID:* Q4.1.62
   [Tags]      C313815
   Open 'Opportunity' with name '${TEST_OPPTY}'
   Create Quote for Oppty '${TEST_OPPTY}'
   Go To Cloud Attachments of the Quote
   Add Cloud Attachment File 'Cloud_Attachment_C313815.txt' to the Quote
   
E-signature for Direct Quote
   [Documentation]        *Use Case ID:* Q4.1.63
   [Tags]      C313816
   Open 'Opportunity' with name '${TEST_OPPTY}'
   Create Quote for Oppty '${TEST_OPPTY}'
   Add products to Quote by Product Codes	DB2-TOD-PB
   Quote Lines Should Contain Product Codes    DB2-TOD-PB
   Get Tax Info
   Bypass Quote Approval
   Go To Generate & eSign
   Select Document Options
   Send to Sign and Go to Agreement
   ${doc name}    Get Curren Agreement Details
   Check Sign Email for Document received by Contact    ${doc name}    ${TEST_CONTACT_EMAIL}    ${TEST_CONTACT_EMAIL_PASS} 