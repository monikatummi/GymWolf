*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library          BuiltIn
Library          Selenium2Library

*** Variables ***
${BROWSER}           chrome
${DELAY}             0.3
${URL}               https://www.gymwolf.com/staging/
${EMAIL}             monikatestib@gmail.com


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
    