*** Settings ***
Documentation     A test suite for Choosing the Trainer
Resource          ../Resources/resource.robot
Library           BuiltIn
Library           Selenium2Library
Test Setup        Registration Process
Test Teardown     Close Browser

*** Variables ***
${AMOUNT_INPUT}       50
      

*** Test Cases ***
Choose Trainer 
	 Choose Trainer   
     Check the result
      
     
*** Keywords ***
Choose Trainer 
    Click Link       Vali endale treener
    Click Element    xpath=//*[@href="/staging/trainer/2"] 
    Click Element    xpath=//*[@id="trainer-duration"]/option[@value='3']
    Click Button     xpath=//html/body/div[2]/div[2]/div/div[4]/form/div[2]/button
    Input Text       correction_amount    ${AMOUNT_INPUT} 
    Click Button     xpath=//html/body/div[1]/div[3]/div/div[1]/div[3]/form/input[3] 
    Set Selenium Timeout  60
    Wait Until Element Is Not Visible  xpath=//*[@src="/assets/bundles/payseracheckoutfrontend/images/ajax-loader.gif"] 
  
    
Check the result
    Page Should Contain   Ost sooritatud

    

     