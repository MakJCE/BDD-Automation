require './features/step_definitions/lib/BusinessPage.rb'
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
        return BusinessPage.new(@page)
    end
end