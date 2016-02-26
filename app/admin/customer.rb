ActiveAdmin.register Customer do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :account, :balance, :secret, :birthday, :password, :password_confirmation


  index do

    column :balance
    column :account
    column :birthday
    actions
  end


  form :html => { :multipart=>true } do |f|
    f.inputs "Customer" do
      f.input  :balance
      f.input  :account
      f.input  :birthday
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row(:balance) if customer.balance?
      row(:account) if customer.account?
      row(:birthday) if customer.birthday?
    end
  end


end
