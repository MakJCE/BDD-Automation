class HomePage
    def initialize(page)
        @page = page
    end

    def exist_the_title(title)
        request = @page.has_content?(title)
        return request
    end
end