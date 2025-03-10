*** Settings ***
Resource    ../pageObject/homePage/homePage.robot
Resource    ../pageObject/loginPage/loginPage.robot
Resource    ../pageObject/base.robot

Test Setup    Run Keywords    Open Flight Application       #precondition
# Test Teardown    Close Flight Application


*** Test Cases ***
User Should Be Able To login With Valid Data 
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Valid Username    username=${VALID_USERNAME}
    Input Password Sign In
    Click Sign In Button on Sign In Screen
    Verify User Successfully Login

User Should Not Be Able To login With Invalid Data 
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Invalid Username    username=${INVALID_USERNAME}
    Input Password Sign In
    Click Sign In Button on Sign In Screen
    Verify User Unsuccessful Login    

User Should Not Be Able To login With Empty Data 
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Empty Username
    Input Empty Password
    Click Sign In Button on Sign In Screen
    Verify User Unsuccessful Login 

User Should Not Be Able To login With Valid Username Invalid Password 
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Valid Username    username=${VALID_USERNAME}
    Input Invalid Password Sign 
    Click Sign In Button on Sign In Screen
    Verify User Unsuccessful Login 

User Should Not Be Able To login With Invalid Username Valid Password 
    Click Sign In Button on Home Screen
    Verify Sign In Screen On Home Screen Appears
    Input Invalid Username    username=${INVALID_USERNAME}
    Input Password Sign In
    Click Sign In Button on Sign In Screen
    Verify User Unsuccessful Login


