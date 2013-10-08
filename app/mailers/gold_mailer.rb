class GoldMailer < ActionMailer::Base
  default from: 'info@profileperfecter.com'

  def gold(body)
    mail(to: '6198477057@txt.att.net', body: body, content_type: "text/html", subject: body)
  end

end
