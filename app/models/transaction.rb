class Transaction < ApplicationRecord
  belongs_to :invoice
  validates_presence_of :invoice_id
  validates_presence_of :credit_card_number
  validates_presence_of :credit_card_expiration_date
  validates_presence_of :result
  validates_numericality_of :invoice_id
  validates_numericality_of :credit_card_number, length: {is: 16}
  validates_numericality_of :credit_card_expiration_date, allow_blank: true

  enum result: { failed: 0, success: 1 }
end