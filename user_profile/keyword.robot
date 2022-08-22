*** Keywords ***
Get User Profile
    [Arguments]    ${user_id}    ${status_code}
    ${response} =    GET On Session    api-user    /${user_id}    expected_status=${status_code}
    Set Test Variable    ${response}
    ${user_resp} =    Set Variable    ${response.json()}
    Set Test Variable    ${user_resp}

Verify Response Code
    [Arguments]    ${status_code}
    Status Should Be    ${status_code}    ${response}

Verify User Body
    Should Be Equal As Strings    ${user_resp['data']['id']}    ${ID}
    Should Be Equal    ${user_resp['data']['email']}            ${EMAIL}
    Should Be Equal    ${user_resp['data']['first_name']}       ${FIRST_NAME}
    Should Be Equal    ${user_resp['data']['last_name']}        ${LAST_NAME}
    Should Be Equal    ${user_resp['data']['avatar']}           ${AVATAR}

Verify User Body Not Found
    Should Be Equal As Strings    ${user_resp}    ${EMPTY_OBJ} 