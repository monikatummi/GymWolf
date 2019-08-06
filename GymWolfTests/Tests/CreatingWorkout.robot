*** Settings ***
Documentation     A test suite for Creating Workout
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration process
Test Teardown     Close Browser


*** Test Cases ***
Create New Workout
    User moves to page             Uus Trenn
	User creates Cardio Workout    Aeroobne Trenn    Jooks    01:30:00    152    10    488    55    Jooksin 10km
	User is on page                Trenn salvestatud 
     
