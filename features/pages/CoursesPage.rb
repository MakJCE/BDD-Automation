class CoursesPage
    def initialize(page)
        @page = page
    end
    def filterListBy(state)
        
    end
    def getListOfCourses()

    end
    def isCourseInTheTable(topic, profesor)
        isInTheTable = false
        rows = @page.all("table tr")
        rows.each_with_index do |row, index|
            inThisRow = (row.has_css?('td', :text => profesor, wait: 0) && row.has_css?('td', :text => topic, wait: 0) )
            isInTheTable = inThisRow || isInTheTable
        end
        return isInTheTable
    end
    def fillFormField(value, field)
        fields = @page.all('form.form div.field')
        fields.each_with_index do |fi, index|
            label = fi.find('label')
            if label.text == field
                if fi.has_css?('input')
                    input = fi.find('input')
                    input.set(value)
                elsif fi.has_css?('div.dropdown')
                    dropdown = fi.find('div.dropdown')
                    dropdown.click()
                    if dropdown.find('span.text', :text => value).visible?
                        dropdown.find('span.text', :text => value).click()
                    else
                        dropdown.find('span.text', :text => value, :visible => false).click()
                    end
                else
                    dropdown = fi.find('textarea')
                    dropdown.set(value)
                end
            end
        end
    end
    def isThisButtonDisabled(buttonText)
        return @page.has_button?(buttonText, disabled: true)
    end
end
