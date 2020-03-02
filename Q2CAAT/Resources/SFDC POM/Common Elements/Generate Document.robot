*** Settings ***
Resource    ../../Commons/Global Setup.robot
Resource    ../Quotes/Quote Details Locators.robot
Resource    Details Page.robot
Resource    ../../Commons/SFDC Common Variables.robot
Library     ImapLibrary    

*** Variables ***
${generate document title}             //div[@id="sbDocGenPreview"]//h1[.="Generate Document"] 
${language selector}	               //select[@name="j_id0:j_id2:pg:j_id45"]
${template selector}                   //select[@ng-model="documentModel.templateId"]
${paper size selector}                 //select[@ng-model="documentModel.paperSize"]
${send to adobe sign button}           //input[@value="Send to eSignature"]
${quote doc page title}                //div[@class="bPageTitle"]//h1[contains(.,"Quote Document")]
${link to view agreement}              //a[.="Click here to view Generated Agreement"]
${agreement page title}                //div[@class="bPageTitle"]//h1[contains(.,"Agreement")]
${agreement name locator}              //span[@title="Specify the name of the agreement."]
${send for signature button}           //input[@value="Send for Signature"]
${signature informer}                  //div[@id="EchoSignWindowInner"]
${successfuly sent message}            //div[@id="post-send-text"]//h1[contains(., "has been successfully sent for signature")]           

*** Keywords ***
Select Document Options
    [Arguments]    ${doc language}=English - United States    ${template}=Federal Quote    ${paper sise}=Default
    #Wait Until Page Contains Element    ${loading mask is hidden}
    Select From List By Label     ${language selector}    ${doc language}
    #Select From List By Label    ${template selector}    ${template}
    #Select From List By Label    ${paper size selector}  ${paper sise}

Send to Sign and Go to Agreement
    #Wait Until Page Contains Element    ${loading mask is hidden}
    Click Element    ${send to adobe sign button}
    Wait Until Page Contains Element    ${link to view agreement}   timeout=300
    Click Element    ${link to view agreement}
    Wait Until Page Contains Element    ${agreement page title}
    Run Keyword If  '${BROWSER}' not in ('googlechrome', 'chrome', 'gc', 'headlesschrome')    Sleep    4
    Wait Until Page Contains Element    ${send for signature button}    
    Click Element    ${send for signature button}
    Wait Until Page Contains Element    ${signature informer}
    sleep   10   
    Select Frame    //iframe[@id="popup"]
    Wait Until Page Contains Element    ${successfuly sent message}
    Unselect Frame        

Get Quote Document Details
    Wait Until Page Contains Element   ${quote doc page title}
    ${document name}    Get value of 'Document Name'
    ${version}          Get value of 'Version'
    [Return]    ${document name}    ${version}
    
Get Curren Agreement Details
    Wait Until Page Contains Element    ${agreement page title}
    ${agreement name}    Get Text    //span[@title="Specify the name of the agreement."]        
    [Return]    ${agreement name}

Check Sign Email for Document received by Contact 
    [Arguments]    ${document}    ${user}    ${password}     ${host}=imap.gmail.com    
    Open Mailbox    host=${host}    user=${user}    password=${password}
    ${expected subject}    Catenate    SEPARATOR=    Please sign ${document}
    ${expected text}       Catenate    SEPARATOR=    After you sign ${document}, all parties will receive a final PDF copy by email.
    ${LATEST}     Wait For Email     sender=echosign@echosign.com    subject=${expected subject}   text=${expected text}    timeout=180
     
    


        
    
        
              
