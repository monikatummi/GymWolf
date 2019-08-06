*** Settings ***
Documentation     A test suite for Choosing the Trainer
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration process
Test Teardown     Close Browser   

*** Test Cases ***
Choose Trainer 
    User moves to page                Vali endale treener
    User is on page                   Hasso
    User chooses trainer and pays     50
    User is on page                   Ost sooritatud
	 
      
  
    

     