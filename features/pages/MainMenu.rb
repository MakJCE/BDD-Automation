require './features/pages/BusinessPage.rb'
require './features/pages/CoursesPage.rb'
class MainMenu
    def initialize(page)
        @page = page
    end
    def click_in_menu(option)
        @page.all("a.item").each do |item|
            if item.text == option
                item.click()
                if item.text == "Empresas"
                    return BusinessPage.new(@page)
                end
                if item.text == "Cursos"
                    return CoursesPage.new(@page)
                end
            end
        end
        return -1
    end
    def click_in_visitanos_button()
        click_on("Visitanos")
    end
end