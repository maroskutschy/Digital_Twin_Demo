*** Settings ***
Library    SikuliLibrary
Library    SeleniumLibrary
Library    EyesLibrary       runner=web    config=applitools.yaml
Test Setup    Open digital twin via Selenium
Test Teardown    Close Browser 

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\Images

*** Keywords ***
Open digital twin via Selenium
    Add Image Path    ${IMAGE_DIR}
    Open Browser    https://forge-digital-twin.autodesk.io/#    chrome
    Maximize Browser Window
    Wait Until Screen Contain    Home_button_in_light.jpg    30   
    
*** Test Cases ***
Open digital twin via Selenium and check rotation buttons and main parts of digital twin
    Click    Home_button_in_Light.jpg
    Click    Front_button.jpg
    Click    Home_button_in_dark.jpg
    Click    Right_button.jpg
    Click    Home_button_in_dark.jpg
    Click    Bottom_button.jpg
    Click    Home_button_in_Light.jpg
    Click    Part1.jpg
    Click    Part2.jpg
    Click    Part3.jpg
    ${variable1}=    Exists   Home_button_in_light.jpg    0 
    ${variable2}=    Exists   Loading.jpg    0 
    Should Be True    ${variable1}
    Should Not Be True    ${variable2}

Open digital twin via Selenium, open Maintenance tab and valide UI via Applitools Eyes
    Click Element    id:maintenance-tab
    Eyes Open
    Eyes Check Window    Maintenance Page   Fully
    Eyes Close Async

Open digital twin via Selenium and validate Maintenance tab via Selenium
    Click Element    id:maintenance-tab
    Wait Until Element Is Visible    id:maintenance-revisions-tab
    Click Element    id:maintenance-revisions-tab
    Page Should Contain    Revision History
    Page Should Contain    Date
    Page Should Contain    Part #
    Page Should Contain    Reviewed By
    Page Should Contain    Result
    Page Should Contain    New Revision
    Page Should Contain    Submit