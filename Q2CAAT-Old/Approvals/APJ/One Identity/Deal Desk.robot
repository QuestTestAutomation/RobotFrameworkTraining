*** Settings ***
Resource            ../../Approvals Keywords.robot
Suite Setup         Approvals Suite Setup
Suite Teardown      Approvals Suite Teardown    
Test Template       Create OID Quote with DealDesk, Leader, Director and Legal Approvals

*** Variables ***
@{discount range}                      60.01    100
@{channel discount range}              20	    100
${one identity license product #1}     PRQ-DDS-PB
@{director approvers}                  David Stepancich
&{director rule}                       chain=Direct New Sale Discount    rule=Global Sales Manager Approval - OI	                approvers=@{director approvers}
&{channel director rule}               chain=Channel New Sale Discount   rule=Global Channel Sales Manager Approval - OI	        approvers=@{director approvers}
@{APJ leader approvers}                Boris Ivancic
&{APJ leader rule}                     chain=Direct New Sale Discount    rule=APJ OI Sales Leader Approval	                        approvers=@{APJ leader approvers}
&{channel APJ leader rule}             chain=Channel New Sale Discount   rule=APJ OI Regional Sales Leader - Channel Discount	    approvers=@{APJ leader approvers}
@{APJ DealDesk approvers}              Marie Wycherley
&{APJ DealDesk rule}                   chain=Direct New Sale Discount    rule=APJ DD Approval - Direct Discount	                    approvers=@{APJ DealDesk approvers}
&{channel APJ DealDesk rule}           chain=Channel New Sale Discount   rule=APJ DD Approval - Channel Discount	                approvers=@{APJ DealDesk approvers}
@{APJ FieldOps approvers}              Greg Molyneux
&{APJ FieldOps rule}                   chain=Direct New Sale Discount    rule=APJ Field Ops Director Approval - Direct Discount	    approvers=@{APJ FieldOps approvers}
&{channel APJ FieldOps rule}           chain=Channel New Sale Discount   rule=APJ Field Ops Director Approval - Channel Discount	approvers=@{APJ FieldOps approvers}

*** Test Cases ***
Identity and Security Mgmt. APJ Direct - New Sales On-Prem License - One Identity - More than 60% Discount should be sent to Deal Desk (or Field Ops Director in APJ)...
    [Tags]    C313491
    ${APJ direct account oppty USD}	    ${one identity license product #1}	    ${discount range}[0]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}     ${one identity license product #1}	    ${discount range}	    ${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ FieldOps rule}
    ${APJ direct account oppty USD}     ${one identity license product #1}	    ${discount range}[1]	${legal apj rule}     ${APJ leader rule}    ${director rule}    ${APJ FieldOps rule}

Identity and Security Mgmt. APJ Channel Quote Discount -Incremental discounts of 20% or greater - Deal Desk (or Field Ops Director in APJ), Regional Business Unit Sales Leader, Sales Manager/Country Manager/Director
    [Tags]    C313507
    ${APJ channel account oppty USD}	${one identity license product #1}	    ${channel discount range}[0]	${legal apj rule}     ${channel APJ leader rule}    ${channel director rule}    ${channel APJ FieldOps rule}
    ${APJ channel account oppty USD}    ${one identity license product #1}	    ${channel discount range}	    ${legal apj rule}     ${channel APJ leader rule}    ${channel director rule}    ${channel APJ FieldOps rule}
    ${APJ channel account oppty USD}    ${one identity license product #1}	    ${channel discount range}[1]	${legal apj rule}     ${channel APJ leader rule}    ${channel director rule}    ${channel APJ FieldOps rule}
    