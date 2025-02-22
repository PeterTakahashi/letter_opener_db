class CreateLetterOpenerDbMailRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :letter_opener_db_mail_records do |t|
      t.text :to
      t.text :from
      t.text :subject
      t.text :html_part
      t.text :text_part
      t.datetime :sent_at

      t.timestamps
    end

    add_index :letter_opener_db_mail_records,
      [:to, :subject, :html_part, :text_part],
      name: "index_letter_opener_db_mail_records_on_to_and_subject_and_body"
  end
end
