module LetterOpenerDb
  class MailRecord < ApplicationRecord
    validates :to, presence: true
    validates :subject, presence: true

    scope :search_by_text, ->(keyword) {
      if keyword.present?
        where(
          "subject LIKE :q OR html_part LIKE :q OR text_part LIKE :q
           OR \"to\" = :keyword OR \"from\" = :keyword",
          q: "%#{keyword}%",
          keyword: keyword
        )
      else
        all
      end
    }

    def body_html
      return "" if html_part.blank?

      _, content = html_part.split("\r\n\r\n", 2)
      content.to_s.strip
    end

    def body_text
      return "" if text_part.blank?

      _, content = text_part.split("\r\n\r\n", 2)
      content.to_s.strip
    end

    def body_preview
      body_text[0, 30]
    end
  end
end
