*** Settings ***
Documentation     A test suite for Choosing the Trainer
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser   

*** Test Cases ***
Choose Trainer 
	 Choose Trainer   
     
      
  
    

     