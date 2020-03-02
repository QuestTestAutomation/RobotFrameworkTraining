*** Settings ***
Suite Setup    AMER NAM DAM Init

*** Keywords ***
AMER NAM DAM Init
    Set Suite Variable    ${NAM direct account oppty}                    GB NAM Approvals TEST - EOG RESOURCES INC - Oppty                                                        children=true
    Set Suite Variable    ${NAM channel account oppty}                   TH NAM Channel Approvals TEST - EOG RESOURCES INC - Oppty                                                children=true
    Set Suite Variable    ${EMEA direct account oppty}                   GB EMEA Approvals TEST - AMGB LTD - Oppty                                                                children=true
    Set Suite Variable    ${EMEA channel account oppty}                  TH EMEA Channel Approvals TEST - AMGB LTD - Oppty                                                        children=true
    Set Suite Variable    ${LATAM direct account oppty}                  GB LATAM Approvals TEST - EMPRESA BRASILEIRA DE TELECOMUNICAÇÕES SA - Oppty                              children=true
    Set Suite Variable    ${LATAM channel account oppty}                 TH LATAM Channel Approvals TEST - EMPRESA BRASILEIRA DE TELECOMUNICAÇÕES SA - Oppty                      children=true
    Set Suite Variable    ${maintenance start date}                      10/10/2021                                                                                               children=true
    
    
    
    
    Set Suite Variable    @{future maint amer dd approvers}              Shannon Kekuna    Joann King    Amber Rickman

    Set Suite Variable    &{future maint amer dd rule}                          chain=Future Maintenance
                                                                         ...    rule=AMER DD Approval - Future Maintenance
                                                                         ...    approvers=@{future maint amer dd approvers}    
                                                                         ...    children=true
                                                                         

    Set Suite Variable    @{future maint emea mgr approvers}                   David Stepancic
    
    Set Suite Variable    &{future maint emea mgr rule}                        chain=Future Maintenance
                                                                         ...   rule=EMEA Sales Manager Approval - Future Maintenance
                                                                         ...   approvers=@{future maint emea mgr approvers}                                                         
                                                                         ...   children=true
                                                                        
                                                                         
    Set Suite Variable    @{future maint emea dd approvers}              Martina Kuecherer    Marie Wycherley    Marnie Caddle
           
    Set Suite Variable    &{future maint emea dd rule}                         chain=Future Maintenance
                                                                         ...   rule=EMEA DD Approval - Future Maintenance
                                                                         ...   approvers=@{future maint emea dd approvers}                                                                    
                                                                         ...   children=true
    
    Set Suite Variable    @{legal us-can approvers}                             Brad Haque
                                                                         ...    Scott Johnston    
                                                                         ...    Tiffany Joseph    
                                                                         ...    Daniel Rothenberg    
                                                                         ...    Doug Wakeman   
                                                                         ...    David Younker    
                                                                          
    Set Suite Variable    &{legal us-can rule}                           chain=Unchained Rule    rule=Inter Company Cross Selling - NAM    approvers=@{legal us-can approvers}     children=true
    Set Suite Variable    @{legal emea approvers}                               Brad Haque
                                                                         ...    Daniel Rothenberg
                                                                         ...    Oliver Blechschmidt
                                                                         ...    Damon Young
                                                                         ...    Zsuzsa Czebe
                                                                         ...    Claire Sobiak
                                                                         ...    Catherine-Ann Counihan      
                                                                                     
                                                                          
    Set Suite Variable    &{legal emea rule}                             chain=Unchained Rule    rule=Inter Company Cross Selling - EMEA    approvers=@{legal emea approvers}        children=true
    Set Suite Variable    @{legal latam approvers}                              Brad Haque
                                                                         ...    Mauricio Gris    
                                                                         ...    Tiffany Joseph    
                                                                         ...    Daniel Rothenberg                  
    Set Suite Variable    &{legal latam rule}                            chain=Unchained Rule    rule=Inter Company Cross Selling - LATAM    approvers=@{legal latam approvers}       children=true     
