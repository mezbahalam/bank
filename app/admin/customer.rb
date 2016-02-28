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
      f.input  :birthday,:start_year => 1920, :end_year => 2000
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row(:name) if client.name?
      row(:balance) if client.balance?
      row(:account) if client.account?
      row(:birthday) if client.birthday?
    end
  end




end
