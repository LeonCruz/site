feature 'Visitor view login page' do
  background do
    visit '/entrar'
  end

  scenario 'must contain a form' do
    expect(page).to have_selector('form[method=post]')
  end

  scenario 'must contain text input for email' do
    expect(page).to have_selector('input[type=email]')
  end

  scenario 'must contain text input for password' do
    expect(page).to have_selector('input[type=password]')
  end

  scenario 'must contain a button for send data' do
    expect(page).to have_selector('button[type=submit]', text: 'Login')
  end

  scenario 'must contain a link for forgot the password' do
    expect(page).to have_selector('a', text: 'Esqueci a senha')
  end

  scenario 'and fill in fields with invalid email and submit' do
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: '123456'

    click_button 'Login'

    expect(page).to have_selector('span', text: 'Email não encontrado')
  end

  scenario 'and fill in fields with invalid password and submit' do
    user = create(:user, password: '12345')

    fill_in 'email', with: user.email
    fill_in 'password', with: 'senhaincorreta'

    click_button 'Login'

    expect(page).to have_selector('span', text: 'A senha está incorreta')
  end

  scenario 'and fill in fields with valid values and submit' do
    user = create(:user, password: '123456')

    fill_in 'email', with: user.email
    fill_in 'password', with: '123456'

    click_button 'Login'

    expect(page).to have_content("Olá, #{user.name}")
  end

  scenario 'and after login click in sair' do
    user = create(:user, password: '123456')

    fill_in 'email', with: user.email
    fill_in 'password', with: '123456'

    click_button 'Login'

    expect(page).to have_selector("a[href='/sair']", text: 'Sair')

    click_link 'sair'

    expect(page).to have_selector("a[href='/entrar']", text: 'Entrar')
  end
end
