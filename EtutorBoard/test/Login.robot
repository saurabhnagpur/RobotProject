*** Settings ***
LIBRARY    SeleniumLibrary  

Suite Setup    Log    I am in Suite Setup


Suite Teardown    Log    I am in Suite Teardown

Test Setup    Log    I am in Test Setup
Test Teardown    Log    I am in Test Teardown
Default Tags    Sanity

*** Test Cases ***
LoginAsAdministrator
    Log    My first Login as admistrator testcase  
    #Set Tags    Administrator 
LoginAsRegularUser
    Log    My first Loin as Regular testcase   
    [Tags]    Regular
FirstSeleniumTestCase
    [Tags]    First
    Open Browser    https://www.google.com    chrome
    #Set Browser Implicit Wait    5
    Input Text    name=q    stock
    #Click Button    name=btnK
    Press Keys    name=q    ENTER
    sleep    5
    Close Browser
LoginToOrangeHRM
    [Documentation]    My First Test Case
    [Tags]    Login
    Open Browser    ${URL}    chrome
    #Set Browser Implicit Wait    10
    LOGINKW
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser
    Log    Test Completed
    Log    This test was executed by %{username} on %{os} from ${CURDIR}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com
@{CRED}    Admin    admin123
&{LOGINDATA}    Username=Admin    Password=admin123

*** Keywords ***
LOGINKW
    Input Text    id=txtUsername    @{CRED}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[Password]    
    Click Button    id=btnLogin    
