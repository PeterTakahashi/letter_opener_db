module LetterOpenerDb
  class DeliveryMethod
    def initialize(values)
      @settings = values
    end

    def deliver!(mail)
      MailRecord.create!(
        to:      mail.to.join(", "),
        from:    mail.from.join(", "),
        subject: mail.subject,
        html_part: mail.html_part,
        text_part: mail.text_part,
        sent_at: Time.current
      )
    end
  end
end
