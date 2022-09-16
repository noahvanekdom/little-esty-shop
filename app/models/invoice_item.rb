class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  enum   status: {pending: 0, packaged: 1, shipped: 2}
 
  validates_presence_of :item_id
  validates_numericality_of :item_id
  validates_presence_of :invoice_id
  validates_numericality_of :invoice_id
  validates_presence_of :quantity
  validates_numericality_of :quantity
  validates_presence_of :unit_price
  validates_numericality_of :unit_price
  validates_presence_of :status


  def self.incomplete_invoices
    select(:invoice_id).distinct.where.not(status: :shipped).pluck(:invoice_id)
  end
end

