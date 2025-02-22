module LetterOpenerDb
  class MailRecordsController < ApplicationController
    DEFAULT_PER_PAGE = 25.freeze
    DEFAULT_PAGE     = 1.freeze

    def index
      @page = (params[:page] || DEFAULT_PAGE).to_i
      @per  = (params[:per]  || DEFAULT_PER_PAGE).to_i

      mail_records = MailRecord.search_by_text(params[:q])

      @total_count = mail_records.count

      offset = (@page - 1) * @per

      @mail_records = mail_records
        .order(sent_at: sort_order)
        .limit(@per)
        .offset(offset)
    end

    def show
      @mail_record = MailRecord.find(params[:id])
    end

    def destroy
      @mail_record = MailRecord.find(params[:id])
      @mail_record.destroy
      redirect_to mail_records_path
    end

    private

    def sort_order
      params[:sort] == "asc" ? :asc : :desc
    end
  end
end