require 'rails_helper'

RSpec.feature "Visitor is able to add an item to the cart", type: :feature, js: true do

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

  scenario "They click add to cart button on the first item" do
    # ACT
    visit root_path
    find('button.btn.btn-primary', match: :first).click
    sleep(1.seconds)
    # DEBUG / VERIFY

    save_screenshot
    expect(page).to have_selector :link, 'My Cart (1)', href: '/cart'
  end
end

