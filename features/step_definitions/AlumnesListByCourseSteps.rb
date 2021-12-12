
Then ("I should see the Alumne with {string} name and {string} lastname in the list") do |name, lastname|
    expect(page.has_css?("table td", :text => "#{name} #{lastname}")).to be true
end