*** Settings ***
Library   SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}            dt_login_button
${email_field}          name=email
${pword_field}          //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${forex_tab}            //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[3]
${AUD/USD}              //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[2]/div[2]/div/div[3]/div[1]/div[3]
${volatility_tab}       //*[@class="cq-symbol-select-btn"]
${volatility10_tab}     //*[@class="ic-icon ic-1HZ10V"]
${rise_btn}             //*[@id="dt_purchase_call_button"]
${duration_value}       //*[@id="dt_simple_duration_datepicker"]/div/div[1]/input
${payout_value}         //*[@id="dt_amount_input"]
${barrier_value}        //*[@id="dt_barrier_1_input"]
${lower_btn}            //*[@id="dt_purchase_put_button"]
${synthetic_tab}        //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[2]
${volatility50}         //*[@class="ic-icon ic-R_50"]

*** Keyword ***


*** Test Cases ***
Open Deriv
    Login   ${my_email}    ${my_pw}  #to pass into secret.txt
    SwitchtoDemoAcc
    BuyRiseContract
    BuyLowerContract
    CheckBarrierError
    CheckMultiplierParameter


