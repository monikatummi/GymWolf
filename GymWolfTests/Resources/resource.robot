*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library          BuiltIn
Library          Selenium2Library

*** Variables ***
${BROWSER}           chrome
${DELAY}             0.3
${URL}               https://www.gymwolf.com/staging/
${EMAIL}             monikatestib@gmail.com
${NAME}              Mari Maasikas
${GENDER}            female
${PASSWORD}          qwerty123
${USERNAME}          tahanvormi
${AMOUNT_INPUT}       50
${EXCERCISE_NAME}         Jooks
${DURATION}               01:30:00
${HEART_RATE}             152
${DISTANCE}               10
${CALORIES}               488
${BODYWEIGHT}             55
${NOTES}                  Jooksin 10km

*** Keywords ***     
Registration Process
    Open Browser To Registration Page
    Create User
    
Open Browser To Registration Page
    Open Browser                ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}
    Click Link                  Registreeru 
    Element Should be visible   signup_email
    
Create User
    Input Text            signup_email   ${EMAIL} 
    Click Button          Registreeru  
    Page Should Contain   Me saatsime e-maili aadressile ${EMAIL}  
    
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
    Page Should Contain   Andmed uuendatud
    
Choose Trainer 
    Click Link       Vali endale treener
    Click Element    xpath=//*[@href="/staging/trainer/2"] 
    Click Element    xpath=//*[@id="trainer-duration"]/option[@value='3']
    Click Button     xpath=//html/body/div[2]/div[2]/div/div[4]/form/div[2]/button
    Input Text       correction_amount    ${AMOUNT_INPUT} 
    Click Button     xpath=//html/body/div[1]/div[3]/div/div[1]/div[3]/form/input[3] 
    Set Selenium Timeout  60
    Wait Until Element Is Not Visible  xpath=//*[@src="/assets/bundles/payseracheckoutfrontend/images/ajax-loader.gif"] 
    Page Should Contain   Ost sooritatud
    
Create Cardio Workout 
    Click Link       Uus Trenn
    Click Element     xpath=//*[contains(text(), "Aeroobne Trenn")]
    Input Text       cardio_exercise_name  ${EXCERCISE_NAME} 
    Input Text       duration     ${DURATION}
    Input Text       heart_rate   ${HEART_RATE}  
    Input Text       distance     ${DISTANCE}    
    Input Text       calories     ${CALORIES}    
    Input Text       bodyweight   ${BODYWEIGHT}  
    Input Text       notes        ${NOTES}       
    Click Button     Salvesta trenn
    Page Should Contain   Trenn salvestatud

    