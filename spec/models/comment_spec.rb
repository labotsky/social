require 'spec_helper'
describe Comment do
	let(:user){FactoryGirl.create(:user)}	
	let(:micropost){FactoryGirl.create(:micropost)}
	before{@comment = micropost.comments.build(content: "Lorem ipsum", micropost_id: micropost,
		post_user_id:user.id)}
	subject{@comment}
	it{should respond_to(:content)}
	it{should respond_to(:micropost_id)}
	it{should respond_to(:post_user_id)}
	it{should be_valid}
	describe 'when micropost_id is nil' do
		before{@comment.micropost_id = nil}
		it{should_not be_valid}
	end
	describe 'with blank content' do
		before{@comment.content = ''}
		it{should_not be_valid}
	end
	describe 'when post_user_id is nil' do
		before{@comment.post_user_id = nil}
		it{should_not be_valid}
	end
end


