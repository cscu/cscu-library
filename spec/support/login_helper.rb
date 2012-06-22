module LoginHelper
  include Devise::TestHelpers
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in :user, @user
  end
end
