class UserMailer < ApplicationMailer
  default from: "Unistore Pro"

  def account_activation user
    @user = user
    mail to: @user.email, subject: t("mail.acc_activation")
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: t("mails.reset_pass_subject")
  end
end
