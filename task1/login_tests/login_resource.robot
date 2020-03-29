*** Settings ***
Documentation   Resources used in logging to system.
Library         SeleniumLibrary

*** Variables ***
${SERVER}           the-internet.herokuapp.com
${BROWSER}          Firefox
${DELAY}            0
${VALID USER}       tomsmith
${VALID PASSWORD}   SuperSecretPassword!
${LOGIN URL}        http://${SERVER}/login
${HOME URL}         http://${SERVER}/secure

*** Keywords ***
Open Browser To The Internet Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    The Internet Page Should Be Open

The Internet Page Should Be Open
    Title Should Be    The Internet
    Element Should Contain    class:example    Login Page

Go To The Internet Page
    Go To    ${LOGIN URL}
    The Internet Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Login

The Internet Secure Page Should Be Open
    Location Should Be    ${HOME URL}
    Title Should Be    The Internet
    Page Should Contain Element    class:success
