Then ('I should see {string} sede in {string} nodo') do |sede, nodo|
    expect(page.has_css?('td', :text => previuostopic)).to be false
    expect(page.has_css?('td', :text => newtopic)).to be true
end

Then ('Then I should see the message {string}') do |message|
    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq message
end