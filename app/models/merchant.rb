class Merchant < ApplicationRecord
  has_many :items
  validates_presence_of :name

  def ready_to_ship
    items.select("items.*, invoice_items.status as not_shipped").joins(:invoice_items).where.not("invoice_items.status = ?", 2)
  end

  def favorite_customers
    Customer.select("customers.*, count(transactions) as transaction_count").joins(invoices: :transactions).where(transactions: {result: 1}).group(:id).order(transaction_count: :desc).limit(5)
  end
end
