feature 'Visitor view home page' do
  scenario 'and see status code 200' do
    visit '/'

    expect(status_code).to be(200)
  end

  scenario 'must contain @Desenvolvedores.Negros' do
    visit '/'

    expect(page).to have_content('@Desenvolvedores.Negros')
  end

  scenario 'must contain Bob Marley' do
    visit '/'

    expect(page).to have_content('Bob Marley')
  end
  
  scenario 'must contain courses' do
    @user = User.create(
                        name: 'Eliana Santos',
                        email: 'eliana@git.com',
                        password: '123456', 
                        photo: 'http://storage//eliana.jpg'
                      )

    @course = Course.create(
                            name: 'Criando Sites Com Ruby',
                            description: 'lorem ipsum',
                            video_id: '129812812',
                            source_code: 'http://storage//file.zip',
                            user: @user,
                          )

    visit '/'

    expect(page).to have_content(@user.name)
    expect(page).to have_content(@course.name)
  end
end