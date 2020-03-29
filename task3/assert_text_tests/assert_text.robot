*** Settings ***
Documentation    A test suite with a test asserting text
Resource         resource.robot

*** Test Cases ***
Assert Text
    [Documentation]    Text is correcty shown after button pressed
    Open Browser To Dynamically Loaded Page
    Click Button    Start
    Assert Text Is Visible    Hello World!
    [Teardown]    Close Browser

*** Keywords ***
Assert Text Is visible
    [Arguments]    ${text}
    Wait Until Element Is Visible    loading    5
    Element Should Not Be Visible    start
    Wait Until Element Is Visible    finish    10
    Element Should Not Be Visible    loading
    Element Text Should Be    finish    ${text}