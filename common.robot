*** Settings ***
Documentation   Suite description
Library   SeleniumLibrary


*** Keyword ***
Login
      [arguments]   ${email}    ${pw}   #to pass into test.robot
	  Open Browser    url=https://app.deriv.com   browser=chrome
	  set window size   2000   1150
      wait until page does not contain element  dt_core_header_acc-info-preloader       60
	  wait until page contains element  ${login_btn}    60
	  click element   ${login_btn}
	  wait until page contains element  ${email_field}     15
	  input text      ${email_field}    ${email}
	  input text      ${pword_field}      ${pw}
	  # to use this // above, type it in find section in inspect
	  click element      ${login_oauth_btn}
#	  //*[text()="Real" and contains(@class,"active")]

SwitchtoDemoAcc
      wait until page does not contain element  dt_core_header_acc-info-preloader       70
     # wait until page contains element  //*[@id="dt_core_account-info_acc-info"]        60
      click element     //*[@id="dt_core_account-info_acc-info"]
      sleep     3
      click element     //*[@id="dt_core_account-switcher_demo-tab"]
      sleep     3
      click element     //*[contains(@id,"dt_VRTC")]    #//*[@class="acc-switcher__id"]
      #reload page

BuyRiseContract
    wait until page does not contain element    chart-container__loader     60
    wait until page contains element       ${volatility_tab}        60
    click element       ${volatility_tab}
    sleep       10
#    wait until page contains element       //*[@id="trade_container"]        60
    click element       ${volatility10_tab}
    sleep       10
    wait until page contains element        ${rise_btn}
    click element      ${rise_btn}
    sleep       5
    click element       //*[@id="dt_positions_drawer_close_icon"]
  #  reload page

ClearInputField
    [arguments]     ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE

BuyLowerContract
    wait until page contains element   ${volatility_tab}       120
    click element       ${volatility_tab}
    click element       ${forex_tab}
    sleep       5
    click element       ${AUD/USD}
    sleep       5
    click element       //*[@id="dt_contract_dropdown"]
    click element       //*[@id="dt_contract_high_low_item"]
#    wait until page contains element        //*[@id="dt_simple_toggle"]
#    click element       //*[@id="dt_simple_toggle"]
#    click element       //*[@id="dropdown-display"]
#    click element       //*[@id="d"]
    click element       ${duration_value}
    ClearInputField     ${duration_value}
    input text          ${duration_value}       2
    click element       //*[@id="dc_payout_toggle_item"]
    ClearInputField     ${payout_value}
    input text          ${payout_value}       15.50
    sleep       3
    click element       ${lower_btn}
    sleep       2
    click element       //*[@id="dt_positions_drawer_close_icon"]

CheckBarrierError
    click element       ${barrier_value}
    ClearInputField     ${barrier_value}
    input text          ${barrier_value}        +1
    click element       //*[@id="dc_payout_toggle_item"]
    ClearInputField     ${payout_value}
    input text          ${payout_value}       10

CheckMultiplierParameter
    click element       //*[@id="dt_contract_dropdown"]
#    click element       //*[@id="chart_container"]/div[1]/div/div/div/button
    page should not contain     //*[@id="chart_container"]/div[1]/div/div/div
    click element       //*[@id="dt_contract_multiplier_item"]
    click element       ${volatility_tab}
    click element       ${synthetic_tab}
    sleep       10
    click element       ${volatility50}
    page should contain     //*[text()="Stake"]     #5a
    #5b
    #5c
    click element       //*[@id="dropdown-display"]
    page should contain     //*[@id="20"]
    page should contain     //*[@id="40"]
    page should contain     //*[@id="60"]
    page should contain     //*[@id="100"]
    page should contain     //*[@id="200"]
    #5d
    #5e
    #5f
    #5g
    #5h



   # reload page
#	 Close Browser