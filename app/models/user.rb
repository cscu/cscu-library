class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  if Rails.env.production?
    devise :database_authenticatable,
           :recoverable, :trackable, :validatable,
           :token_authenticatable
  else
    devise :database_authenticatable, :registerable,
           :recoverable, :trackable, :validatable,
           :token_authenticatable
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
