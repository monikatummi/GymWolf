*** Settings ***
Documentation     A test suite for Creating Workout
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser


*** Test Cases ***
Create New Workout
	 Create Cardio Workout   
     
