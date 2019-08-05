*** Settings ***
Documentation     A test suite for Creating Workout
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser

*** Variables ***
${EXCERCISE_NAME}         Jooks
${DURATION}               01:30:00
${HEART_RATE}             152
${DISTANCE}               10
${CALORIES}               488
${BODYWEIGHT}             55
${NOTES}                  Jooksin 10km


*** Test Cases ***
Create New Workout
	 Create Cardio Workout   
     Check the result
      
     
*** Keywords ***

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
    
Check the result
    Page Should Contain   Trenn salvestatud
     