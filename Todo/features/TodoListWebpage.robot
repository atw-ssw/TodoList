*** Settings ***
Resource    ../resources/import_features.robot

*** Variables ***
${url}                      https://abhigyank.github.io/To-Do-List/
${broswer}                  chrome
${btnAddItem}               xpath=//a[contains(text(), "Add Item")]
${btnTodoItem}              xpath=//a[contains(text(), "To-Do Tasks")]
${btnCompletedItem}         xpath=//a[contains(text(), "Completed")]
${txtNewTask}               id=new-task
${btnAdd}                   xpath=//i[contains(text(), "add")]

*** Keywords ***
Open broswer and access website
    Open Browser    ${url}  ${broswer}
    Title Should Be     To-Do List

Input Todo Item
    Click Element       ${btnAddItem}
    Input Text          ${txtNewTask}        Test Input New Task
    Click Element       ${btnAdd}

Delete Todo Item
    Click Element       ${btnTodoItem}
    Element Should Contain      text-1       Test Input New Task
    Click Element       xpath=//*[@id="1" and contains(text(), "Delete")]

Check Todo Item list
    Click Element       ${btnTodoItem}
    Element Should Contain      text-1       Test Input New Task
    Click Element       text-1

Verify Completed list
    Click Element       ${btnCompletedItem}
    Element Should Contain      xpath=//span[contains(text(), "Test Input New Task")]       Test Input New Task

Delete Completed Item
    Click Element       ${btnCompletedItem}
    Click Element       xpath=//*[@id="1" and contains(text(), "Delete")]