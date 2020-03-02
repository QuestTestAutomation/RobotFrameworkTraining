*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range}                      60.01    100
${oid syslog license}                  BAA-BAL-CB
${productQuantity}	                   5000
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	                                    approvers=@{director approvers}
@{APJ leader approvers}                Boris Ivancic
&{APJ leader rule}                     chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval	                                            approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}              Christopher Stock
&{APJ DealDesk rule}                   chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount	                                        approvers=@{APJ DealDesk approvers}
@{APJ step 4 approvers}	               Christopher Stock
&{APJ step 4 rule}	                   chain=Direct New Sale Discount    rule=APJ BU Controller Approval - Syslog and Safeguard - Direct Discount	    approvers=@{APJ step 4 approvers}

*** Test Cases ***
One identity syslog Product - Region APJ - more than 60% - Approval should be send to Country Manager/Sales Manager/Director, Regional Business Unit Sales Leader, Deal Desk
    [Tags]    C408752
    ${APJ direct account oppty USD}	    ${oid syslog license}	    ${discount range}[0]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    ${APJ direct account oppty USD}     ${oid syslog license}	    ${discount range}	    ${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    ${APJ direct account oppty USD}     ${oid syslog license}	    ${discount range}[1]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ step 4 rule}    ${productQuantity}
    