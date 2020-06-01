*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${url}      http://restapi.demoqa.com/


*** Test Cases ***
Get Data From Rest API
    create session  mySession     ${url}
    ${response}=    Get Request     mySession    utilities/weather/city/Delhi
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #   Validation
    ${status_code}=    convert to string     ${response.status_code}
    Should Be Equal   ${status_code}       200

    ${body}=       convert to string     ${response.content}
    Should contain  ${body}     Delhi

    ${header}=      Get From Dictionary      ${response.headers}     Content-Type
    log to console  ${header}

