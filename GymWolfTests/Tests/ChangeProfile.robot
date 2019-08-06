*** Settings ***
Documentation     A test suite for Changing Profile
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser


*** Test Cases ***
Change Profile
	 Fill In General Information    Mati    female    parool    pumpameVormi
     
     
