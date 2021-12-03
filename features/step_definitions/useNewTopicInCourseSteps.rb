Then ('the course with previous {string} topic and Juan profesor should have now the {string} as new topic') do |previuostopic, newtopic|
    expect(page.has_css?('td', :text => previuostopic)).to be false
    expect(page.has_css?('td', :text => newtopic)).to be true
end