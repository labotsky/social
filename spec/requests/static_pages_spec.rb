require 'spec_helper'

describe "Static Pages" do

	subject {page}

	describe "Home Page" do
		before {visit root_path}
		it {should have_content('Social Network')}
		it {should have_content('Войти')}
		it {should have_button('Присоединиться')} 
		it {should have_selector('title', :text => 'Social Network')} 	
	end

	describe "Getting start Page" do		
		before { visit getting_started_path(user) }		
		let(:user){ FactoryGirl.create(:user) }
		it {should have_content('Приветствуем вас')}
		it {should have_content('Загрузить фотографию')}
		it {should have_content('Пустите меня в Дестини!')}
		it {should have_content(user.name)}
		it {should have_content(user.surname)}
	end
end
