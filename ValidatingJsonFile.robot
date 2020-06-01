*** Settings ***

Library  JSONLibrary
Library  os
Library  Collections

*** Test Cases ***
TestCase1:
    ${json_object}=    Load JSON From File      E:/OnlyForPython/SELENIUM/RobotFramework/india.json
    ${name_value}=      Get Value From Json     ${json_object}      $.firstName
    log to console   ${name_value[0]}
    Should Be Equal  ${name_value[0]}    John

    ${number}=      Get Value From Json     ${json_object}      $.phoneNumbers[0].number
    log to console   ${number[0]}

     ${address}=      Get Value From Json     ${json_object}      $.address.city
    log to console   ${address}
    Should Be Equal  ${address[0]}    Nara




#    https://restcountries.eu/rest/v2/alpha/IN