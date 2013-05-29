FactoryGirl.define do
	factory :user do
		name	"Sergey"
		surname	"Labotsky"
		email	"sergey1993.08@mail.ru"
		country	"Belarus"
		sity	"Minsk"
		date	"1993-05-13"
		password	"foobar"
		password_confirmation	"foobar"
	end	
end