*** Settings ***
Library    String    

*** Variables ***
${search_input_on_header}                 id:phSearchInput
${search_button_on_header}                id:phSearchButton
${searh_term_warning}                     id:searchResultsWarningMessageBox
${search_all_button_on_summay_view}       id:searchAllSummaryView
${search_input_on_results_view}           id:secondSearchText
${search_button_on_results_view}           id:secondSearchButton
${search_result_header}                   //tr[@class="headerRow"]
${link_edit}                              link:Edit
${mask}                                   //div[@id="mask"]

*** Keywords ***
Locator for search inside '${object_type}'
    ${loc}    Catenate    SEPARATOR=    //div[@data_title="    ${object_type}    "]/a
    [Return]    ${loc}

Locator for '${object_type}' with '${name}' in search results
    ${loc}    Catenate    SEPARATOR=    //div[@id="searchResultsHolderDiv"]//th[@scope="row" and @class=" dataCell\ \ "]//a[@data-seclke="    ${object_type}    "][text()="    ${name}    "]
    [Return]    ${loc} 
