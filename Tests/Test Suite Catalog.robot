*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CATALOGUE_URL}        https://www.jpetstore.com/catalog
${CATEGORY_XPATH}       //div[@class='category']//a[contains(text(), '${category_name}')]
${PRODUCT_XPATH}        //div[@class='product']//a[contains(text(), '${product_name}')]
${ITEM_XPATH}           //div[@class='item']//a[contains(text(), '${item_name}')]
${SEARCH_INPUT}         css:input[name='keyword']

*** Test Cases ***
Browse Catalogue
    Open Browser    ${CATALOGUE_URL}    Chrome
    Maximize Browser Window
    Click Category    Cats
    Click Product    Cat Food
    Click Item    Premium Cat Food
    Close Browser

Search Catalogue
    Open Browser    ${CATALOGUE_URL}    Chrome
    Maximize Browser Window
    Search For Product    Cat Food
    Close Browser

*** Keywords ***
Open Browser To Catalogue
    Open Browser    ${CATALOGUE_URL}    Chrome

Click Category
    [Arguments]    ${category_name}
    Click Element    ${CATEGORY_XPATH}

Click Product
    [Arguments]    ${product_name}
    Click Element    ${PRODUCT_XPATH}

Click Item
    [Arguments]    ${item_name}
    Click Element    ${ITEM_XPATH}

Search For Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_INPUT}    ${product_name}
    Press Keys    ${SEARCH_INPUT}    \\13  # Enter key
