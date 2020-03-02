*** Settings ***
Resource       ../Resources/Commons/Global Setup.robot
Resource       ../Resources/Commons/SFDX.robot
Suite Setup    Local suite setup

*** Test Cases ***

All PSO Products which are not sold per hour or per day should be marked as non-dis-countable at product level
    [Tags]    C740983
    [Documentation]
    ...    https://jira.labs.quest.com/browse/ITQTC-3268
    ...    https://tr.labs.quest.com/testrail/index.php?/cases/view/740983 
    @{pso discountable}    Execute data query    "SELECT Description,Name,ProductCode,SBQQ__NonDiscountable__c FROM Product2 WHERE Family = 'Professional Services' AND IsActive = True AND SBQQ__NonDiscountable__c = False AND Product_Type__c IN ('PREPAID CONSULTING', 'PREPAID PROJECT MGMT', 'CONSULTING', 'PREPAID INSTALLATION', 'PREPAID TRAINING', 'PROJECT MANAGEMENT', 'TRAINING') AND ((NOT Description LIKE '%%DAILY RATE%%') AND (NOT Description LIKE '%PER DAY%') AND (NOT Description LIKE '%PER HOUR%') AND (NOT Description LIKE '%per hr%'))"
    Log Many    @{pso discountable}
    Should Be Empty    ${pso discountable}    msg=Found DISCOUNTABLE PSO products sold NOT per hour or per day. See LOG MANY above for details   


All PSO Products which are sold per hour or per day should be marked as discountable at product level
    [Tags]    C740982   
    [Documentation]
    ...    https://jira.labs.quest.com/browse/ITQTC-3268
    ...    https://tr.labs.quest.com/testrail/index.php?/cases/view/740982 
    @{pso non discountable}    Execute data query    "SELECT Description,Name,ProductCode,SBQQ__NonDiscountable__c FROM Product2 WHERE Family = 'Professional Services' AND IsActive = True AND (Description LIKE '%DAILY RATE%' OR Description LIKE '%PER DAY%' OR Description LIKE '%per hour%' OR Description LIKE '%per hr%') AND SBQQ__NonDiscountable__c = True AND Product_Type__c IN ('PREPAID CONSULTING', 'PREPAID PROJECT MGMT', 'CONSULTING', 'PREPAID INSTALLATION', 'PREPAID TRAINING', 'PROJECT MANAGEMENT', 'TRAINING')"
    Log Many    @{pso non discountable}
    Should Be Empty    ${pso non discountable}    msg=Found NON DISCOUNTABLE PSO products sold per hour or per day. See LOG MANY above for details
    
*** Keywords ***
Local suite setup
    Suite Setup
    SFDX Login with Default Credentials
    

    