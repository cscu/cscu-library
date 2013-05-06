module LoginHelper
  include Devise::TestHelpers

  def logout
    sign_out :user
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in :user, @user
  end

  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @admin = FactoryGirl.create(:admin)
    sign_in :user, @admin
  end
end
