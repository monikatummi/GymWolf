*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library          BuiltIn
Library          Selenium2Library

*** Variables ***
${BROWSER}                chrome
${DELAY}                  0.3
${URL}                    https://www.gymwolf.com/staging/
${EMAIL}                  monikatestib@gmail.com
${NAME}                   Mari Maasikas
${GENDER}                 female
${PASSWORD}               qwerty123
${USERNAME}               tahanvormi
${AMOUNT_INPUT}           50
${EXCERCISE_NAME}         Jooks
${DURATION}               01:30:00
${HEART_RATE}             152
${DISTANCE}               10
${CALORIES}               488
${BODYWEIGHT}             55
${NOTES}                  Jooksin 10km

*** Keywords ***     
Registration process
    Open Browser To Registration Page
    Create User
    
Open browser to registration page
    Open Browser                ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}
    Click Link                  Registreeru 
    Element Should be visible   signup_email
    
Create user
    Input Text            signup_email   ${EMAIL} 
    Click Button          Registreeru  
    Page Should Contain   Me saatsime e-maili aadressile ${EMAIL}  
        
Fill in general information 
    [Arguments]      ${name}    ${gender}    ${password}    ${username}
    Click Element    xpath://html/body/div[1]/div/div[4]/ul/li[6]/a/span[1]
    Click Element    xpath://html/body/div[1]/div/div[4]/ul/li[6]/ul/li[1]/a
    Input Text       name   ${name}  
    Click Element    gender_female
    Radio Button Should Be Set To  gender   ${gender}
    Click Element    xpath=//*[@name="Date_Month"]/option[@value='04']
    Click Element    xpath=//*[@name="Date_Day"]/option[@value='11']
    Click Element    xpath=//*[@name="Date_Year"]/option[@value='1991']
    Input Text       password  ${password}
    Input Text       password_repeat  ${password}
    Input Text       username   ${username} 
    Click Button     Salvesta
    Page Should Contain   Andmed uuendatud
 
User moves to page
    [Arguments]    ${page}
    Click Link     ${page} 
    
User is on page
    [Arguments]    ${text}
    Wait Until Keyword Succeeds    1 min    5 sec    Page Should Contain    ${text}       
    
User chooses trainer and pays
    [Arguments]      ${amount_input}
    Click Element    xpath=//*[@href="/staging/trainer/2"] 
    Click Element    xpath=//*[@id="trainer-duration"]/option[@value='3']
    Click Button     xpath=//html/body/div[2]/div[2]/div/div[4]/form/div[2]/button
    Input Text       correction_amount    ${amount_input}  
    Click Button     xpath=//html/body/div[1]/div[3]/div/div[1]/div[3]/form/input[3]
    

User creates Cardio Workout
    [Arguments]      ${type}   ${exercise_name}    ${duration}    ${heart_rate}    ${distance}    ${calories}    ${body_weight}    ${notes}
    Click Element    xpath=//*[contains(text(), "${type}")]
    Input Text       cardio_exercise_name  ${exercise_name} 
    Input Text       duration     ${duration}
    Input Text       heart_rate   ${heart_rate}  
    Input Text       distance     ${distance}    
    Input Text       calories     ${calories}    
    Input Text       bodyweight   ${body_weight}  
    Input Text       notes        ${notes}       
    Click Button     Salvesta trenn

    