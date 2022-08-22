*** Settings ***
Library         RequestsLibrary
Resource        keyword.robot
Resource        data.robot
Test Setup      Create Session    api-user    ${URL}

*** Test Cases ***
Get User Profile Success
    Get User Profile        ${ID}    ${STATUS_CODE_SUCCESS}
    Verify Response Code    ${STATUS_CODE_SUCCESS}
    Verify User Body

Get User Profile Not Found
    Get User Profile        ${ID_NOT_FOUND}    ${STATUS_CODE_ERROR}
    Verify Response Code    ${STATUS_CODE_ERROR}
    Verify User Body Not Found