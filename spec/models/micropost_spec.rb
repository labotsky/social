require 'spec_helper'
describe Micropost do
  let(:user){FactoryGirl.create(:user)}
  before{@micropost = user.microposts.build(content: "Lorem ipsum", user_id: user, post_user_id:user.id)}
  subject {@micropost}
  it{should respond_to(:content)}
  it{should respond_to(:user_id)}
  it{should respond_to(:post_user_id)}
  it{should be_valid}
  describe "when user_id is not present" do
  	before {@micropost.user_id = nil}
  	it{should_not be_valid}
  end
  describe "with blank content" do
  	before{@micropost.content = ''}
  	it{should_not be_valid}
  end
  describe 'when post_user_id is nil' do
    before{@micropost.post_user_id = nil}
    it{should_not be_valid}
  end
end
