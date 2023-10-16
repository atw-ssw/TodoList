*** Settings ***
Library                 SeleniumLibrary
Resource                ../resources/import_features.robot
Test Teardown           Close Browser

*** Test Cases ***
Verify Todo list web page
    Open broswer and access website
    Input Todo Item
    Input Todo Item
    Delete Todo Item
    Check Todo Item list
    Verify Completed list
    Delete Completed Item
    