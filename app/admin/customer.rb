ActiveAdmin.register Customer, as: "client" do



  permit_params :name, :account, :balance, :secret, :birthday, :password, :password_confirmation

  #menu label: "Clients"

  index do

    column :name
    column :balance
    column :account
    column :birthday
    actions
  end

  filter :name
  filter :account
  filter :birthday

  form :html => { :multipart=>true } do |f|
    f.inputs "Customer" do
      f.input :name
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
      row(:name) if customer.name?
      row(:balance) if customer.balance?
      row(:account) if customer.account?
      row(:birthday) if customer.birthday?
    end
  end


end
