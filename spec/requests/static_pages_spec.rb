require 'spec_helper'

describe "Static Pages" do

	subject {page}

	describe "Home Page" do
		before {visit root_path}
		it {should have_content('Social Network')}
		it {should have_content('Войти')}
		it {should have_content('Присоединиться')} 
		it {should have_selector('title', :text => 'Social Network')} 	
	end
end
