class ClientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.client_mailer.account_updated.subject
  #
  def account_updated(name,balance,account,birthday)
    @name = name
    @balance = balance
    @account = account
    @birthday = birthday
    @greeting = "Hi #{name} "
    mail to: "to@example.org"
  end
end
