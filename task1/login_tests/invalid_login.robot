*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               Contains possibilities where username or password is invalid
Suite Setup       Open Browser To The Internet Page
Suite Teardown    Close Browser
Test Setup        Go To The Internet Page
Test Template     The Internet Page With Invalid Credentials Should Fail
Resource          login_resource.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
    [Documentation]    Given username is invalid
Invalid Password                 ${VALID USER}    invalid
    [Documentation]    Given password is invalid

*** Keywords ***
The Internet Page With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    The Internet Should Have Failed

The Internet Should Have Failed
    Location Should Be    ${LOGIN URL}
    Title Should Be    The Internet
    Page Should Contain Element    class:error
    Element Should Contain    flash    is invalid!