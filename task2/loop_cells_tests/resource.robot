*** Settings ***
Documentation   Resources used in looping cells.
Library         SeleniumLibrary
Library         ExtendedSeleniumLibrary.py

*** Variables ***
${SERVER}       the-internet.herokuapp.com
${BROWSER}      Firefox
${DELAY}        0
${URL}          http://${SERVER}/challenging_dom

*** Keywords ***
Open Browser To Challenging DOM Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Challenging DOM Page Should Be Open

Challenging DOM Page Should Be Open
    Title Should Be    The Internet
    Element Should Contain    class:example    Challenging DOM