*** Settings ***
Documentation     A test suite for Changing Profile
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser

*** Variables ***
${NAME}                   Mari Maasikas
${GENDER}                 female
${PASSWORD}               qwerty123
${USERNAME}               tahanvormi

*** Test Cases ***
Change Profile
	 Fill In General Information   
     Check the result
      
     
*** Keywords ***
Fill In General Information 
    Click Element    xpath://html/body/div[1]/div/div[4]/ul/li[6]/a/span[1]
    Click Element    xpath://html/body/div[1]/div/div[4]/ul/li[6]/ul/li[1]/a
    Input Text       name   ${NAME}  
    Click Element    gender_female
    Radio Button Should Be Set To  gender   ${GENDER}
    Click Element    xpath=//*[@name="Date_Month"]/option[@value='04']
    Click Element    xpath=//*[@name="Date_Day"]/option[@value='11']
    Click Element    xpath=//*[@name="Date_Year"]/option[@value='1991']
    Input Text       password  ${PASSWORD}
    Input Text       password_repeat  ${PASSWORD}
    Input Text       username   ${USERNAME} 
    Click Button     Salvesta
    
Check the result
    Page Should Contain   Andmed uuendatud
     