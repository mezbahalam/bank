class Customer  < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :authentication_keys => [:account]

  validates_presence_of :name, :birthday, :account

  def email_required?
    false
  end


end
