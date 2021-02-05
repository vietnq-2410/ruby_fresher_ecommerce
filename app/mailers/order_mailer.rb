class OrderMailer < ApplicationMailer
  default from: "Unistore Pro"

  def send_order order
    @order = order
    mail to: @order.user_email, subject: t("mails.send_order")
  end
end
