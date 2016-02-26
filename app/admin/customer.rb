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

  permit_params :account, :balance, :secret, :birthday


  index do

    column :balance
    column :account
    column :birthday
    column :secret
    actions
  end


  form :html => { :multipart=>true } do |f|
    f.inputs "Customer" do
      f.input  :balance
      f.input  :account
      f.input  :birthday
      f.input  :secret
    end
    f.actions
  end

  show do
    attributes_table do
      row(:balance) if offender.balance?
      row(:account) if offender.account?
      row(:birthday) if offender.birthday?
      row(:secret) if offender.secret?
    end
  end


end
