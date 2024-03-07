*** Settings ***
Library           SeleniumLibrary
Resource    ../Utilities.robot

*** Variables ***
${HOME_PAGE_URL}    https://jpetstore.aspectran.com/catalog/
@{CATEGORIES}    FISH    CATS    DOGS    BIRDS    REPTILES
@{ELEMENTS}    QuickLinks    MainImageContent    SidebarContent

*** Test Cases ***
Click on all the category buttons
    Open And Maximize Browser To ${HOME_PAGE_URL}
    FOR    ${element}    IN    @{ELEMENTS}
        Click on all categories from ${element}
    END

*** Keywords ***
Click on all categories from ${element}
    FOR    ${category}    IN    @{CATEGORIES}
        TRY
            Click on ${category} from ${element}
            Location should be    https://jpetstore.aspectran.com/catalog/categories/${category}
        EXCEPT
            log   Fail!    ERROR
        END
        Go To    ${HOME_PAGE_URL}
    END

Click on ${category} from ${element}
    Click Element    //*[@id="${element}"]//*[@href="/catalog/categories/${category}"]