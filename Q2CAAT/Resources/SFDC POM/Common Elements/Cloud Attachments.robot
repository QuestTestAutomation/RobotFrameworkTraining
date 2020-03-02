*** Setting ***
Resource    ../../Commons/Global Setup.robot


*** Variables ***
${choose files button}            //a[@id="chooseFilesCommand"]
${file path input}                //input[@type="file" and @class="dz-hidden-input"]
${files table}                    //table[@id="gridCloudFiles"]
${is new file asterisk}           //table[@id="gridCloudFiles"]//tr[1]/td/img[@src="/Content/images/asterisk.gif"]
${upload button}                  //a[@id="uploadCommand"] 
${confirm successful upload}      //div[@class="uploadsuccess"]/b[.="All files uploaded successfully!"]
${confirm to delete button}       //div//span[.="Are you sure you want to delete this record?"]/../..//button[@id="yesButton"]


*** Keywords ***
Get Delete Button locator for file '${file name}'
    ${loc}    Catenate     SEPARATOR=    //table[@id="gridCloudFiles"]//td[.="    ${file name}    "]/../td/a[.="Delete"]
    [Return]    ${loc}


Upload Cloud Attachment
    [Arguments]    ${file path}
    ${split path}    Split Path    ${file path}
    Wait Until Page Contains Element    ${choose files button}
    Choose File    ${file path input}    ${file path}
    Wait Until Page Contains Element    ${is new file asterisk} 
    Table Cell Should Contain    //table[@id="gridCloudFiles"]    1    2    ${split path[1]}
    Click Element    ${upload button}
    Wait Until Element Is Not Visible    ${is new file asterisk}    
    #Wait Until Page Does Not Contain Element    ${is new file asterisk}
    Wait Until Page Contains Element    ${confirm successful upload}

Delete Cloud Attachment
    [Arguments]    ${file name}
    Sleep    2
    Wait Until Page Contains Element    ${choose files button}
    Sleep    2
    ${delete button locator}    Get Delete Button locator for file '${file name}'
    ${what to delete}    Get Element Count    ${delete button locator}
    Return From Keyword If    ${what to delete} < 1       
    Click Element    ${delete button locator}
    Wait Until Page Contains Element    ${confirm to delete button}
    Sleep    1        
    Click Element    ${confirm to delete button}
    Page Should Not Contain Element    ${delete button locator}    message=Cloud Attachment was ${file name} not deleted     loglevel=NONE 
    
Check Cloud Attachment Presence
    [Arguments]    ${file name}
    Wait Until Page Contains Element    ${choose files button}
    ${delete button locator}    Get Delete Button locator for file '${file name}'
    Wait Until Page Contains Element    ${delete button locator}
    ${what to delete}    Get Element Count    ${delete button locator}
    Run Keyword If    ${what to delete} < 1    Capture Page Screenshot    
    Should Be True    ${what to delete} >= 1   msg=Cloud Attachment '${file name}' not found
    