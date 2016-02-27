class Customer < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :authentication_keys => [:account, :birthday]

  def email_required?
    false
  end


end
