class MainMenu
    def initialize(page)
        @page = page
    end
    def click_in_menu(option)
        @page.all("a.item").each do |item|
            if item.text == option
                item.click()
            end
        end
        return Business.new(@page,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]")
    end
end