*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String
Library     OperatingSystem
Resource    SFDX.robot
Resource    SFDC Common Variables.robot

*** Variables ***
#&{SF_USER}               email=gborodin@quest.com.devfull    display_name=Gennady Borodin    password=`q1w2e3r4
&{SF_USER}                email=tuser@quest.com.devfull    display_name=Test User    password=`q1w2e3r4
#&{SF_USER}               email=gborodin@quest.com.sfdctst    display_name=Gennady Borodin    password=`q1w2e3r4t5
${BROWSER}                gc
${BASE_URL}               https://questsoftware--devfull.cs44.my.salesforce.com
${LIGHTNING_BASE_URL}     https://questsoftware--devfull.lightning.force.com/lightning
#${BASE_URL}              https://questsoftware--sfdctst.cs23.my.salesforce.com
${ENVIRONMENT}            Local    #Values: Remote for SauseLabs, Local for local webdriver
${MAX_WAIT_TIME}          30
${VERIFICATION_CODE}      61000
${TEST_RUN_NAME}          Test Run - 12
${CI_ENABLED}             No
${TEST_RAIL_PROJECT}      Quote to Cash
${TEST_RAIL_PLAN}         Continuous Testing
${VISUAL_VERBOSE}         No
${CONFIG}                 ${EMPTY}



*** Keywords ***
Suite Setup
    Run Keyword If    '${CI_ENABLED}'=='Yes'    Import TRailLibrary    config=${CONFIG}
    log     ${CURDIR}
    ${path}    Split Path    ${CURDIR}
    ${path}    Split Path    ${path[0]}
    ${file path}    Catenate    ${path[0]}${/}Resources${/}Files${/}sfdxurl.${SANDBOX}
    SFDX Login to Org    ${file path}    ${SF_USER}[email]        

Test Teardown
    Close Browser
    Log    == TEST VARIABLES ==
    Log Variables

Wait for Page Elements Load
    sleep    1

Import TRailLibrary
    [Arguments]    ${config}=${EMPTY}
    Run Keyword If    '${config}'=='${EMPTY}'
    ...    Import Library    TRailLibrary    url=https://tr.labs.quest.com/testrail    user=gennady.borodin@quest.com     api_key=GTRera/oi1ZBV8kUZbd5-6Fx1CaEIdQVeDAEyblor    project=${TEST_RAIL_PROJECT}    plan=${TEST_RAIL_PLAN}    run_name=${TEST_RUN_NAME}
    Run Keyword If    '${config}' is not '${EMPTY}'
    ...    Import Library    TRailLibrary    url=https://tr.labs.quest.com/testrail    user=gennady.borodin@quest.com     api_key=GTRera/oi1ZBV8kUZbd5-6Fx1CaEIdQVeDAEyblor    project=${TEST_RAIL_PROJECT}    plan=${TEST_RAIL_PLAN}    run_name=${TEST_RUN_NAME}    config={'Profile':'${config}'}       

Scroll To Element JS
    [Arguments]    ${element_xpath_locator}
    ${element_xpath_locator}=    Replace String Using Regexp    ${element_xpath_locator}    \/@.*?$    ${EMPTY}
    ${element_xpath_locator}=    Replace String    ${element_xpath_locator}    "    '
    ${element_xpath_locator}=    Replace String    ${element_xpath_locator}    xpath=    ${EMPTY}
    Run Keyword And Ignore Error    Execute Javascript    window.document.evaluate("${element_xpath_locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
    
Highlight Element
    [Arguments]    ${element_xpath_locator}    ${color}
    ${element_xpath_locator}=    Replace String Using Regexp    ${element_xpath_locator}    \/@.*?$    ${EMPTY}
    ${element_xpath_locator}=    Replace String    ${element_xpath_locator}    "    '
    ${element_xpath_locator}=    Replace String    ${element_xpath_locator}    xpath=    ${EMPTY}
    Run Keyword And Ignore Error    Execute Javascript    window.document.evaluate("${element_xpath_locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border="solid ${color}"; 


Growl
    [Arguments]    ${message}    ${type}
    ${message}=    Replace String    ${message}    '    "    
    Run Keyword And Ignore Error    Execute Javascript    var script = document.createElement('script'); script.innerHTML = 'var vNotify=function(){var a={topLeft:"topLeft",topRight:"topRight",bottomLeft:"bottomLeft",bottomRight:"bottomRight",center:"center"},b={fadeInDuration:1e3,fadeOutDuration:1e3,fadeInterval:50,visibleDuration:5e3,postHoverVisibleDuration:500,position:a.topRight,sticky:!1,showClose:!0},c=function(a){return a.notifyClass="vnotify-info",i(a)},d=function(a){return a.notifyClass="vnotify-success",i(a)},e=function(a){return a.notifyClass="vnotify-error",i(a)},f=function(a){return a.notifyClass="vnotify-warning",i(a)},g=function(a){return a.notifyClass="vnotify-notify",i(a)},h=function(a){return i(a)},i=function(a){if(!a.title&&!a.text)return null;var b=document.createDocumentFragment(),c=document.createElement("div");c.classList.add("vnotify-item"),c.classList.add(a.notifyClass),c.style.opacity=0,c.options=p(a),a.title&&c.appendChild(k(a.title)),a.text&&c.appendChild(j(a.text)),c.options.showClose&&c.appendChild(l(c)),c.visibleDuration=c.options.visibleDuration;var d=function(){c.fadeInterval=r("out",c.options.fadeOutDuration,c)},e=function(){clearTimeout(c.interval),clearTimeout(c.fadeInterval),c.style.opacity=null,c.visibleDuration=c.options.postHoverVisibleDuration},f=function(){c.interval=setTimeout(d,c.visibleDuration)};b.appendChild(c);var g=m(c.options.position);return g.appendChild(b),c.addEventListener("mouseover",e),r("in",c.options.fadeInDuration,c),c.options.sticky||(c.addEventListener("mouseout",f),f()),c},j=function(a){var b=document.createElement("div");return b.classList.add("vnotify-text"),b.innerHTML=a,b},k=function(a){var b=document.createElement("div");return b.classList.add("vnotify-title"),b.innerHTML=a,b},l=function(a){var b=document.createElement("span");return b.classList.add("vn-close"),b.addEventListener("click",function(){q(a)}),b},m=function(a){var b=o(a),c=document.querySelector("."+b);return c?c:n(b)},n=function(a){var b=document.createDocumentFragment();return container=document.createElement("div"),container.classList.add("vnotify-container"),container.classList.add(a),container.setAttribute("role","alert"),b.appendChild(container),document.body.appendChild(b),container},o=function(b){switch(b){case a.topLeft:return"vn-top-left";case a.bottomRight:return"vn-bottom-right";case a.bottomLeft:return"vn-bottom-left";case a.center:return"vn-center";default:return"vn-top-right"}},p=function(a){return{fadeInDuration:a.fadeInDuration||b.fadeInDuration,fadeOutDuration:a.fadeOutDuration||b.fadeOutDuration,fadeInterval:a.fadeInterval||b.fadeInterval,visibleDuration:a.visibleDuration||b.visibleDuration,postHoverVisibleDuration:a.postHoverVisibleDuration||b.postHoverVisibleDuration,position:a.position||b.position,sticky:null!=a.sticky?a.sticky:b.sticky,showClose:null!=a.showClose?a.showClose:b.showClose}},q=function(a){a.style.display="none",a.outerHTML="",a=null},r=function(a,c,d){function e(){g=f?g+i:g-i,d.style.opacity=g,g<=0&&(q(d),s()),(!f&&g<=h||f&&g>=h)&&window.clearInterval(j)}var f="in"===a,g=f?0:d.style.opacity||1,h=f?.8:0,i=b.fadeInterval/c;f&&(d.style.display="block",d.style.opacity=g);var j=window.setInterval(e,b.fadeInterval);return j},s=function(){var a=document.querySelector(".vnotify-item");if(!a)for(var b=document.querySelectorAll(".vnotify-container"),c=0;c<b.length;c++)b[c].outerHTML="",b[c]=null};return{info:c,success:d,error:e,warning:f,notify:g,custom:h,options:b,positionOption:a}}();'; document.head.appendChild(script);
    Run Keyword And Ignore Error    Execute Javascript    var style = document.createElement('style');style.type="text/css";style.media="screen";style.innerHTML=".vnotify-container{position:fixed}.vnotify-container.vn-top-right{right:10px;top:65px}.vnotify-container.vn-top-left{top:10px;left:10px}.vnotify-container.vn-bottom-right{bottom:10px;right:10px}.vnotify-container.vn-bottom-left{bottom:10px;left:10px}.vnotify-container.vn-center{top:50%;left:50%;transform:translate(-50%,-50%)}.vnotify-container .vn-close{position:absolute;top:5px;right:10px;width:15px;height:15px;padding:2px;cursor:pointer}.vnotify-container .vn-close:after,.vnotify-container .vn-close:before{content:'';position:absolute;width:100%;top:50%;height:2px;background:#fff}.vnotify-container .vn-close:before{-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);transform:rotate(45deg)}.vnotify-container .vn-close:after{-webkit-transform:rotate(-45deg);-moz-transform:rotate(-45deg);transform:rotate(-45deg)}.vnotify-item{width:20em;padding:15px;position:relative;-webkit-border-radius:5px;-moz-border-radius:5px;-ms-border-radius:5px;border-radius:5px;margin-bottom:15px;opacity:.75;-ms-filter:\\"progid:DXImageTransform.Microsoft.Alpha(Opacity=75)\\";filter:alpha(opacity=75)}.vnotify-item:hover{opacity:1}.vnotify-title{font-weight:700}.vnotify-info{background:#3498db;color:#fff}.vnotify-success{background:#2ecc71;color:#fff}.vnotify-error{background:#e74c3c;color:#fff}.vnotify-warning{background:#f39c12;color:#fff}.vnotify-notify{background:#333;color:#fff}";document.head.appendChild(style);
    Run Keyword And Ignore Error    Execute Javascript    vNotify.${type}({text:'${message} ', title:'TEST INFO', visibleDuration: 3000, fadeInDuration: 100});
    
Visualize keyword result
    [Arguments]    ${message}    ${locator}=${EMPTY}
    Return From Keyword If    '${VISUAL_VERBOSE}' != 'Yes'
    ${type}=        Set Variable If    '${KEYWORD STATUS}' == 'FAIL'    error    success
    ${color}=       Set Variable If    '${KEYWORD STATUS}' == 'FAIL'    \#e74c3c    \#2ecc71
    ${message}=     Set Variable If    '${KEYWORD STATUS}' != 'FAIL'    ${message}    ${KEYWORD MESSAGE}
    ${loc_string}=  Replace String    ${locator}    '    ${EMPTY}        
    Run Keyword If  '${loc_string}' != '${EMPTY}'    Highlight Element    ${locator}    ${color}
    Run Keyword If  '${loc_string}' != '${EMPTY}'    Scroll To Element    ${locator}
    Growl    ${message}    ${type}
    
Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})
     
         
       

  