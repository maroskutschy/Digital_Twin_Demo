*** Settings ***
Library    SikuliLibrary
Library    Browser
Test Setup    Open digital twin via Playwright

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\Images

*** Keywords ***
Open digital twin via Playwright
    Add Image Path    ${IMAGE_DIR}
    Open Browser
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    https://forge-digital-twin.autodesk.io/#
    Wait Until Screen Contain    Home_button_in_light.jpg    30   
    
*** Test Cases ***
Open digital twin via Playwright and check rotation buttons and main parts of digital twin
    SikuliLibrary.Click    Home_button_in_Light.jpg
    SikuliLibrary.Click    Home_button_in_Light.jpg
    SikuliLibrary.Click    Front_button.jpg
    SikuliLibrary.Click    Home_button_in_dark.jpg
    SikuliLibrary.Click    Right_button.jpg
    SikuliLibrary.Click    Home_button_in_dark.jpg
    SikuliLibrary.Click    Bottom_button.jpg
    SikuliLibrary.Click    Home_button_in_Light.jpg
    SikuliLibrary.Click    Part1.jpg
    SikuliLibrary.Click    Part2.jpg
    SikuliLibrary.Click    Part3.jpg
    ${variable1}=    Exists   Home_button_in_light.jpg    0 
    ${variable2}=    Exists   Loading.jpg    0 
    Should Be True    ${variable1}
    Should Not Be True    ${variable2}

Open digital twin via Playwright and validate Maintenance tab via Selenium
    Browser.Click    id=maintenance-tab
    Browser.Click    id=maintenance-revisions-tab
    Browser.Get Text    id=maintenance-revisions   contains    Revision History
    Browser.Get Text    id=maintenance-revisions   contains    Date 
    Browser.Get Text    id=maintenance-revisions   contains    Part # 
    Browser.Get Text    id=maintenance-revisions   contains    Reviewed By 
    Browser.Get Text    id=maintenance-revisions   contains    Result 
    Browser.Get Text    id=maintenance-revisions   contains    New Revision 
    Browser.Get Text    id=maintenance-revisions   contains    Submit     