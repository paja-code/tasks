*** Settings ***
Documentation     A test suite with a test for valid login.
...
...               User can login to The Internet page properly
Resource          login_resource.robot

*** Test Cases ***
Valid Login
    [Documentation]    User can login to The Internet page
    Open Browser To The Internet Page
    Input Username    ${VALID USER}
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    The Internet Secure Page Should Be Open
    [Teardown]    Close Browser
