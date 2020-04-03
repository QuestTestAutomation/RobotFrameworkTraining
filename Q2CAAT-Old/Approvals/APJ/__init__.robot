*** Settings ***
Suite Setup    APJ DAM Data Init    


*** Keywords ***
APJ DAM Data Init
    Set Suite Variable    ${APJ direct account oppty USD}            GB APJ Approvals - CHOSHI CITY - Oppty                                                                children=true 
    Set Suite Variable    ${APJ channel account oppty USD}           TH APJ Channel Approvals TEST - CHOSHI CITY - Oppty                                                   children=true
    Set Suite Variable    ${APJ direct account oppty SGD}            GB APJ Approvals - CHOSHI CITY - Oppty - SGD                                                          children=true
    Set Suite Variable    ${APJ channel account oppty SGD}           TH APJ Channel Approvals - CHOSHI CITY - Oppty - SGD                                                  children=true  
    Set Suite Variable    ${APJ direct account oppty KRW}            GB APJ Approvals - CHOSHI CITY - Oppty - KRW                                                          children=true  
    Set Suite Variable    ${APJ channel account oppty KRW}           TH APJ Channel Approvals - CHOSHI CITY - Oppty - KRW                                                  children=true
    Set Suite Variable    ${APJ direct account oppty CNY}            GB APJ Approvals - CHOSHI CITY - Oppty - CNY                                                          children=true
    Set Suite Variable    ${APJ channel account oppty CNY}           TH APJ Channel Approvals - CHOSHI CITY - Oppty - CNY                                                          children=true
    Set Suite Variable    ${maintenance start date}                  10/10/2021                                                                                            children=true
    Set Suite Variable    @{legal apj approvers}                     Mike Peevey
    Set Suite Variable    &{legal apj rule}                          chain=Unchained Rule    rule=Inter Company Cross Selling - APJ    approvers=@{legal apj approvers}    children=true                
                                                                                                                                 
                                                                     
    Set Suite Variable    @{future maint apj dd approvers}           Marie Wycherley
    
    Set Suite Variable    &{future maint apj dd rule}                       chain=Future Maintenance    
                                                                     ...    rule=APJ DD Approval - Future Maintenance    
                                                                     ...    approvers=@{future maint apj dd approvers}       children=true 
    #Set Global Variable    ${direct new sale chain}                   Direct New Sale Discount
    #Set Global Variable    ${apj sales mgr rule}                      APJ DP Sales Manager / Director Approval    
    