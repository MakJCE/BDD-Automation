class RequestAccessPage
    def initialize(page)
        @page = page
    end
    def get_email_from_field()
        value = @page.find("#form-acceso").value
        return value
    end
    def get_name_field()
        value = @page.find("#nombre").value
        return value
    end
    def get_motive_field()
        value = @page.find("#motivo").value
        return value
    end
    def name_field_is_empty()
        value = get_name_field()
        return value.empty?
    end
    def motive_field_is_empty()
        value = get_motive_field()
        return value.empty?
    end 
end