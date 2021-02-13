feature 'Visitor view home page' do
  scenario 'and see status code 200' do
    visit '/'

    expect(status_code).to be(200)
  end

  scenario 'must contain treinamentos' do
    visit '/'

    expect(page).to be('treinamentos')
  end

  scenario 'must contain rapidinhas' do
    visit '/'

    expect(page).to be('rapidinhas')
  end
end