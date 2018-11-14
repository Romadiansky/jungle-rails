require 'rails_helper'

RSpec.feature "Visitor clicks on the product from home page and is taken to the product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel#{rand(6)+1}.jpg"),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click a product link" do
    # ACT
    visit root_path
    within 'article', :match => :first do
      click_link('Details »')
    end
    sleep(1.seconds)
    # DEBUG / VERIFY

    save_screenshot
    expect(page).to have_css 'section.products-show'
  end
end
