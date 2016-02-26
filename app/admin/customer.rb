ActiveAdmin.register Customer do



  permit_params :account, :balance, :secret, :birthday, :password, :password_confirmation


  index do

    column :balance
    column :account
    column :birthday
    actions
  end

  filter :account
  filter :birthday

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
