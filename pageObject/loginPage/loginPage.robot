*** Settings ***
Documentation    Login page keywords related
Variables    login-page-locators.yaml

*** Variables ***
${VALID_USERNAME}    support@ngendigital.com
${INVALID_USERNAME}    wrong@wrong.com
${VALID_PASSWORD}    abc123
${EMPTY}    ' '
${INVALID_PASSWORD}    wrongpassword

*** Keywords ***
Verify Sign In Screen On Home Screen Appears
    Wait Until Element Is Visible    locator=${username_input}
    
Input Valid Username
    [Arguments]    ${username} 
    Input Text    locator=${username_input}   
    ...    text=${username}

Input Invalid Username
    [Arguments]    ${username}=${VALID_USERNAME}    # if username empty,valid username will be default
    Input Text    locator=${username_input}   
    ...    text=${INVALID_USERNAME}

Input Password Sign In    # Keywords and action not allowed to be the same
    [Arguments]    ${password}=${VALID_PASSWORD}
    Input Password    locator=${password_input}    
    ...    text=${VALID_PASSWORD}

Input Empty Username
    [Arguments]    ${username}=${VALID_USERNAME} 
    Input Text    locator=${username_input}   
    ...    text=${EMPTY}

Input Empty Password
    [Arguments]    ${username}=${VALID_USERNAME}
    Input Text    locator=${username_input}   
    ...    text=${EMPTY}

Input Invalid Password Sign 
    [Arguments]    ${password}=${VALID_PASSWORD}
    Input Password    locator=${password_input}    
    ...    text=${INVALID_PASSWORD}

Click Sign In Button on Sign In Screen
    Click Element    locator=${sign_in_button_signin}

Verify User Successfully Login
    Wait Until Element Is Visible    locator=${sign_out_button}
    Element Text Should Be    xpath=${sign_out_button}    Sign Out

Verify User Unsuccessful Login
    Wait Until Element Is Visible    xpath=${sign_in_page}    #stay at sign in page
    # Wait Until Element Is Visible    xpath=//android.widget.Toast[@text="Invalid username/password"]    timeout=5s


Login
    [Arguments]    ${username}=${VALID_USERNAME}    ${password}=${VALID_PASSWORD}
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Valid Username    username=${username}
    Input Password Sign In    password=${password}
    Click Sign In Button on Sign In Screen
    Verify User Successfully Login