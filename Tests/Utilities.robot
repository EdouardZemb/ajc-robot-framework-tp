*** Keywords ***
Fill And Submit Login Form
    [Arguments]    ${username}    ${password}
    Input Text    username    ${username}
    Input Password    password    ${password}
    Click Button    Login

Generate Unique Username
    ${timestamp}=    Get Current Date
    ${random_string}=    Generate Random String    5    [NUMBERS]
    ${username}=    Catenate    ${BASE_USERNAME}    _    ${random_string}    _    ${timestamp}
    RETURN    ${username}

Read JSON File
    [Arguments]    ${file_path}
    ${content}=    Get File    ${file_path}
    ${parsed_json}=    Evaluate    json.loads('''${content}''')    json
    RETURN    ${parsed_json}