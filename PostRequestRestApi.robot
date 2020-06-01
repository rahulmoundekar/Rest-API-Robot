*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${url}      http://restapi.demoqa.com/customer/


*** Test Cases ***
Customer Registration
    create session  mySession     ${url}
    ${body}=    create dictionary   	FirstName=Rahul 	LastName=M  	Username=RahulM	    Password=rahul12345 	Email=rahul@gmail.com
    ${header}=      create dictionary   Content-Type=applicaiton/json

    ${response}=    Post Request     mySession    register   data=${body}     headers=${header}

    log to console      ${response.status_code}
    log to console      ${response.content}


    # Validation
    ${res_body}=    convert to string   ${response.content}
    Should Contain  ${res_body}     OPERATION_SUCCESS
    Should Contain  ${res_body}     Operation completed successfully



#       http://jsonpath.com
#       http://jsonpathfinder.com/