*** Settings ***
Resource             ../../Approvals Keywords.robot
Suite Setup          Approvals Suite Setup
Suite Teardown       Approvals Suite Teardown
Test Template        Create Quote With Maintenece Start Date in Future and check approvals
Force Tags           future_maintenance    non_standard_terms

*** Variables ***
${data protection dl license product}	    ADT-APP-PS-247

@{future maint amer mgr approvers dp}	    David Stepancic

&{future maint amer mgr rule dp}	        chain=Future Maintenance    
                                            ...    rule=Global Sales Manager Approval - DP    
                                            ...    approvers=@{future maint amer mgr approvers dp}
                                            ...    children=true
@{AMER DealDesk approvers}	                Shannon Kekuna
                                            ...    Joann King
                                            ...    Amber Rickman
&{future maint amer dd rule}                chain=Direct New Sale Discount    rule=AMER DD Approval - Direct Discount    approvers=@{AMER DealDesk approvers}
@{EMEA DealDesk approvers}                  Martina Kuecherer
                                            ...    Marie Wycherley
                                            ...    Marnie Caddle
&{future maint emea dd rule}                chain=Direct New Sale Discount    rule=EMEA DD Approval - Direct Discount   approvers=@{EMEA DealDesk approvers}
 

*** Test Cases ***
Data Protection NAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313636
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                                | Future date                | MGR approval                    |  DD approval                
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM direct account oppty}    ${data protection dl license product}    ${maintenance start date}     ${future maint amer mgr rule dp}     ${future maint amer dd rule}
    
    
Data Protection EMEA Direct Quote Maintenance Start Date in future-APPROVER IS Troy Steen
    [Tags]    C313637
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                                 | Future date                | MGR approval                    |  DD approval                
 #----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${EMEA direct account oppty}    ${data protection dl license product}    ${maintenance start date}    ${future maint amer mgr rule dp}    ${future maint emea dd rule}
    
Data Protection LATAM Direct Quote Maintenance Start Date in future-APPROVER IS SALES REP MGR AND DEAL DESK
    [Tags]    C313638
 #-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                                  | Future date                | MGR approval                    |  DD approval             
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM direct account oppty}    ${data protection dl license product}    ${maintenance start date}    ${future maint amer mgr rule dp}     ${future maint amer dd rule}
    
Data Protection NAM Channel Quote Maintenance Start Date in future-APPROVER IS 1) Manager of Sales Rep 2) Deal Desk
    [Tags]    C313652
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                                | Future date                | MGR approval                    |  DD approval                
 #-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${NAM channel account oppty}    ${data protection dl license product}    ${maintenance start date}     ${future maint amer mgr rule dp}     ${future maint amer dd rule}

Data Protection LATAM Channel Quote Maintenance Start Date in future-APPROVER IS Troy Steen and George Karabatsos
    [Tags]    C313654
 #-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 #   Oppty                      |   Product                                  | Future date                | MGR approval                    |  DD approval             
 #--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ${LATAM channel account oppty}    ${data protection dl license product}    ${maintenance start date}    ${future maint amer mgr rule dp}     ${future maint amer dd rule}
    