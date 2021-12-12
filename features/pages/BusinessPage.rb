class BusinessPage
    def initialize(page)
        @page = page
    end
    def count_rows(xpath)
        return @page.all(:xpath, xpath).count
    end
    def count_columns(xpath)
        size = 0
        @page.within(:xpath, xpath) do
            size = @page.all('th').count
        end
        return size
    end

    def get_position_column(object, columns)
        size = count_columns(columns)
        column = 1
        value = ""
        while column <= size do
            value = @page.find(:xpath, columns+"/th["+column.to_s+"]").text
            if (object == value)
                return column
            end
            column = column + 1
        end
        return -1
    end

    def all_values_are_same(object, position_column,rows)
        size = count_rows(rows)
        row = 0
        column = "td["+position_column.to_s+"]"
        while (row < size) do
            row = row + 1
            if (@page.find(:xpath, rows+"["+row.to_s+"]/"+column).text != object)
                return false
            end
        end
        return true
    end
    
    def get_position(object, list)
        value = 0
        list.each do |sec|
            value = value + 1
            if (sec == object)
                return value
            end
        end
        return -1
    end
    
    
    def all_rows_have_the_value(object, position_column,rows, value, value_close)
        size = count_rows(rows)
        row = 0
        column = "td["+position_column.to_s+"]"
        while (row < size) do
            row = row + 1
            @page.find(:xpath, rows+"["+row.to_s+"]/"+column+"/button").click
            if (@page.has_content?(value) == false)
                return false
            end
            @page.click_on(value_close)
        end
        return true
    end

    def push_the_filter()
        @page.find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[1]').click
    end

    def get_position_of_element(option,element)
        list = @page.find(:xpath, element).text
        list = list.split("\n")
        return get_position(option,list)
    end

    def push_section(section)
        xpath = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]"
        position = get_position_of_element(section,xpath)
        if (position != -1)
            @page.find(:xpath, xpath+"/div["+position.to_s+"]").click
        end
        if (position == -1)
            raise "Section "+string+" not found."
        end
        return position
    end

    def push_option(option,section) 
        xpath = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]"
        position_section = get_position_of_element(section,xpath)
        if (position_section == -1)
            raise "Section "+string+" not found."
        end
        xpath_option = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/div[2]/div["+position_section.to_s+"]/div[2]"
        position = get_position_of_element(option,xpath_option)
        if (position == -1) 
            raise "Option "+option+" not found."
        end
        @page.find(:xpath, xpath_option+'/div['+position.to_s+']').click
    end

    def all_values_column_are_equal(value, column)
        columns = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr'
        rows = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr'
        position_column = get_position_column(column, columns)
        if (position_column == -1)
            raise "Column "+column+" not found."
        end
        return all_values_are_same(value,position_column,rows)
    end
    def all_modules_are_equal(name_button,column, value)
        columns = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr'
        rows = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr'
        position_column = get_position_column(column, columns)
        if (position_column == -1)
            raise "Column "+column+" not found."
        end
        return all_rows_have_the_value(value,position_column,rows,value,"Cerrar")
    end
    def deselect_filter_selected()
        @page.find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div[2]/i").click;
    end
    def deselect_all_filters_selected()
        @page.find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/a/i").click;
    end

    def page_mark_the_filter(filter)
        elements = @page.find("#root > div > div.ui.container > div.app > div > div.pusher > div.ui.segment").text
        if (elements.include? filter)
            return true
        else
            return false
        end
    end
    def push_first_eye_button()
        @page.find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[1]/td[8]/button").click
    end
    def click_checkboxs(rows)
        row = 1
        while (row <= rows) do
            @page.find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr["+row.to_s+"]/td[1]/input").click
            row = row + 1
        end
    end
    def get_graduates_selected()
        graduates = @page.find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[3]/span/div/div").text
        graduates = graduates.to_i
        return graduates
    end
end