*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range}                      30.01    100
${oid safeguard license}               SPO-SFG-PB-247    #SFM-SFG-TB-247
${productQuantity}	                   160
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	                                approvers=@{director approvers}
@{APJ leader approvers}                Boris Ivancic
&{APJ leader rule}                     chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval	                                        approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}              Christopher Stock
&{APJ DealDesk rule}                   chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount	                                    approvers=@{APJ DealDesk approvers}
@{APJ step 4 approvers}	               Christopher Stock
&{APJ step 4 rule}	                   chain=Direct New Sale Discount    rule=APJ BU Controller Approval - Syslog and Safeguard - Direct Discount	approvers=@{APJ step 4 approvers}

*** Test Cases ***
One identity Safeguard Product - Region APJ - more than 30% Approvals should sent to Sales Manager/Country Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408748
    ${APJ direct account oppty USD}	    ${oid safeguard license}	    ${discount range}[0]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    ${APJ direct account oppty USD}     ${oid safeguard license}	    ${discount range}	    ${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    ${APJ direct account oppty USD}     ${oid safeguard license}	    ${discount range}[1]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    