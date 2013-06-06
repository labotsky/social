require 'spec_helper'

describe "Static Pages" do

	subject {page}

	describe "Home Page" do
		before {visit root_path}
		it {should have_content('Destiny')}
		it {should have_button('Войти')}
		it {should have_button('Присоединиться')} 
		it {should have_selector('title', :text => 'Destiny')} 	
	end

	describe "Getting start Page" do		
		before do
			visit root_path
			fill_in "session_email", with: user.email.upcase
			fill_in "session_password", with: user.password
			click_button "Войти" 
			visit getting_started_path
		end			
		let(:user){ FactoryGirl.create(:user) }
		it {should have_content('Приветствуем вас')}
		it {should have_content('Загрузить фотографию')}
		it {should have_content('Пустите меня в Дестини!')}
		it {should have_content(user.name)}
		it {should have_content(user.surname)}
		it {should have_css("img[src='/images/fallback/register_default.png']")}		
	end
end
