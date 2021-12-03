When ('I press the option {string}') do |option|
    number_option = 0
    if (option != "Cancelar" && option != "Solicitar")
        raise "Option "+option+" not found."
    end
    if (option == "Cancelar")
        number_option = 1
    end
    if (option == "Solicitar")
        number_option = 2
    end 

    find(:xpath, "/html/body/div[2]/div/div[2]/form/button["+number_option.to_s+"]").click
end
Then('I return to the page with title {string}') do |title|
    expect(page.has_content?(title)).to be true
end
Then('Appear a message saying {string}') do |value|
    message = find(:xpath,"/html/body/div/div/div[2]/div/div/div/p").text.to_s
    expect(message == value).to be true
end