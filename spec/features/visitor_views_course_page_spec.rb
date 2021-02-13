feature 'Visitor views course page' do
  scenario 'and see status code 200' do
    user = create(:user)
    course = create(:course, user: user)

    visit '/'
    click_on course.name
                          
    expect(status_code).to be 200
  end
  scenario 'must contain course' do
    user = create(:user)
    course = create(:course, user: user)

    visit '/'
    click_on course.name
    
    expect(page).to have_content(course.name)
    expect(page).to have_content('Download')
    expect(page).to have_content('Código Fonte')
  end
end