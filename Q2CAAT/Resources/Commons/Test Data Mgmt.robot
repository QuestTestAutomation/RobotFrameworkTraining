*** Settings ***
Library     ExcelLibrary
Resource    Global Setup.robot
Resource    SFDC Common Variables.robot


*** Keywords ***
Fetch Random Test Object From Worksheet 
    [Arguments]    ${worksheet}    ${data file}=_Data.xlsx
    log    ${CURDIR}
    Open Excel Document    filename=${CURDIR}${/}..${/}..${/}${SANDBOX}${data file}    doc_id=testdata
    #${rd}    Read Excel Row     row_num=5     max_num=3   sheet_name=${worksheet}
    ${sheet}           Get Sheet    ${worksheet}
    ${data}            Make List From Excel Sheet    ${sheet}
    ${row count}       Get Length    ${data}
    ${random row}      Evaluate    random.randint(1, ${row count}-1)    modules=random
    &{test object}     Create Dictionary
    FOR   ${key}    ${val}    IN ZIP    ${data[0]}     ${data[${random row}]}
        Set To Dictionary    ${test object}    ${key}=${val}
    END 
    Close Current Excel Document
    [Return]    &{test object}

Load Variable-Value Pairs From Worksheet to Dictionary
    [Arguments]     ${worksheet}    ${data file}=_Data.xlsx
    Open Excel Document    filename=${CURDIR}${/}..${/}..${/}${SANDBOX}${data file}    doc_id=testdata
    ${sheet}           Get Sheet    ${worksheet}
    @{data}            Make List From Excel Sheet    ${sheet}
    ${row count}       Get Length    ${data}
    &{vars}          Create Dictionary    
    FOR    ${row}    IN    @{data}
        Set To Dictionary    ${vars}    ${row[0]}=${row[1]} 
    END
    Close Current Excel Document   
    Remove From Dictionary    ${vars}    Name
    [Return]    &{vars}

Load All Records From Worksheet to Dictionary
    [Arguments]     ${worksheet}    ${data file}=_Data.xlsx
    log    ${CURDIR}
    Open Excel Document    filename=${CURDIR}${/}..${/}..${/}${SANDBOX}${data file}    doc_id=testdata
    #${rd}    Read Excel Row     row_num=5     max_num=3   sheet_name=${worksheet}
    ${sheet}           Get Sheet    ${worksheet}
    @{rows}            Make List From Excel Sheet    ${sheet}
    ${row count}       Get Length    ${rows}
    @{test data}    Create List    
    FOR    ${row}    IN    @{rows}
         &{record dict}    Create Dictionary From Rows    ${rows[0]}    ${row}
         Append To List    ${test data}    ${record dict}    
    END
    Remove From List    ${test data}    0
    Close Current Excel Document
    [Return]    @{test data}
    
Create Dictionary From Rows
    [Arguments]    ${header row}    ${data row}
    &{test object}     Create Dictionary
    FOR   ${key}    ${val}    IN ZIP    ${header row}     ${data row}
        Set To Dictionary    ${test object}    ${key}=${val}
    END 
    [Return]    &{test object}
    
    