*** Settings ***
Documentation   A test suite with a loop test
Resource        resource.robot

*** Test Cases ***
Loop Cells
    [Documentation]    Loop cells of "Sit" column and log them to console
    Open Browser To Challenging DOM Page
    @{column}=    Get Table Column Cell Values    Sit
    :FOR    ${item}    IN    @{column}
    \    Log To Console    ${item}
    [Teardown]    Close Browser
