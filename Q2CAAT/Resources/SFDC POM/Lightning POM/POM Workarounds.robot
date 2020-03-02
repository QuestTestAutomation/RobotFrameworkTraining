*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Async JS Click
    [Arguments]    ${loc}
    [Documentation]    Some elements are accessible only through async JS.
    Execute Async Javascript    var callback = arguments[arguments.length - 1]; document.evaluate('${loc}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click(); function answer(){callback();}; window.setTimeout(answer, 2);