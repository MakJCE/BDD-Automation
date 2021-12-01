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

def count_columns(xpath)
    size = 0
    within(:xpath, xpath) do
        size = all('th').count
    end
    return size
end

def count_rows(xpath)
    return all(:xpath, xpath).count
end

def get_position_column(object, columns)
    size = count_columns(columns)
    column = 1
    value = ""
    while column <= size do
        value = find(:xpath, columns+"/th["+column.to_s+"]").text
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
        if (find(:xpath, rows+"["+row.to_s+"]/"+column).text != object)
            return false
        end
    end
    return true
end

def all_rows_have_the_value(object, position_column,rows, value, value_close)
    size = count_rows(rows)
    row = 0
    column = "td["+position_column.to_s+"]"
    while (row < size) do
        row = row + 1
        find(:xpath, rows+"["+row.to_s+"]/"+column+"/button").click
        if (has_content?(value) == false)
            return false
        end
        click_on(value_close)
    end
    return true
end