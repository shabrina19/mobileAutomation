*** Settings ***
Documentation    Home page keywords related
# Library    AppiumLibrary
# Variables    ../pageObject/base.robot

*** Keywords ***
Verify Homepage Appears
    Wait Until Element Is Visible    locator=${sign_in_button_homepage}
Click Sign In Button on Home Screen
    Click Element    locator=${sign_in_button_homepage}