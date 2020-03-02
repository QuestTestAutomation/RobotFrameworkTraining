*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with Leader Approval, Director Approval and Legal Approval

*** Variables ***
@{discount range}                      30.01    60
${one identity license product #1}     EAY-DMZ-PB-247
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI    approvers=@{director approvers}
@{APJ leader approvers}                Boris Ivancic
&{APJ leader rule}                     chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval    approvers=@{APJ leader approvers}


*** Test Cases ***
Identity and Security Mgmt. APJ Direct - New Sales On-Prem License - One Identity - 31% to 60% approval Discount should be sent to "Regional Business Unit Sales Leader" along with "Country Manager/Sales Manager/Director"
    [Tags]    C313487
    ${APJ direct account oppty USD}	    ${one identity license product #1}	    ${discount range}[0]	${legal apj rule}     ${APJ leader rule}    ${director rule}
    ${APJ direct account oppty USD}     ${one identity license product #1}	    ${discount range}	    ${legal apj rule}     ${APJ leader rule}    ${director rule}
    ${APJ direct account oppty USD}     ${one identity license product #1}	    ${discount range}[1]	${legal apj rule}     ${APJ leader rule}    ${director rule}
    