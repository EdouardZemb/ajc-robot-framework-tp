*** Settings ***
Library           SeleniumLibrary
Library           String
Library    DateTime
Library           OperatingSystem
Resource    Utilities.robot

*** Variables ***
${LOGIN_URL}      https://jpetstore.aspectran.com/account/signonForm
${BASE_USERNAME}       toto
${VALID_PASSWORD}       toto_password

*** Keywords ***
Open And Maximize Browser To Login Page
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window

*** Test Cases ***
Example of how to load JSON
    ${object}=  Read JSON File    ./Ressources/test.json
    log    Hello, my name is ${object["firstname"]} ${object["lastname"]}    WARN

Login Test
    ${username}=    Generate Unique Username
    Open And Maximize Browser To Login Page
    Fill And Submit Login Form    ${username}    ${VALID_PASSWORD}
    Wait Until Page Contains    Welcome, ${username}
    Close Browser

Invalid Login Test
    Open And Maximize Browser To Login Page
    Fill And Submit Login Form    invalid_username    invalid_password
    Wait Until Page Contains    Invalid username or password
    Close Browser

