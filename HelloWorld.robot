*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String
Library     OperatingSystem


*** Variables ***
${Browser}  gc
${url}  http://www.erail.in

*** Keyword ***
Hello world
    Log  "Hello World"
    

*** Test Cases ***
TC1
    Hello world
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    
    
    