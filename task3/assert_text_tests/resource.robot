*** Settings ***
Documentation   Resources used in logging to system.
Library         SeleniumLibrary

*** Variables ***
${SERVER}       the-internet.herokuapp.com
${BROWSER}      Firefox
${DELAY}        0
${URL}          http://${SERVER}/dynamic_loading/1

*** Keywords ***
Open Browser To Dynamically Loaded Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Dynamically Loaded Page Should Be Open

Dynamically Loaded Page Should Be Open
    Title Should Be    The Internet
    Element Should Contain    class:example    Dynamically Loaded Page Elements
