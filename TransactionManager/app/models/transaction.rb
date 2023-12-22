# app/models/transaction.rb

class Transaction < ApplicationRecord
  belongs_to :category
  validates_presence_of :title, :amount, :bank_name, :category_id

  # Filters scopes ...
  scope :by_category, ->(category) { joins(:category).where(categories: { name: category }) }
  scope :by_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }
  scope :by_title, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :by_bank_name, ->(bank_name) { where('bank_name LIKE ?', "%#{bank_name}%") }
  scope :by_period, ->(period) {
    case period
    when 'current_month'
      where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    when 'previous_month'
      where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_month)
    when 'this_week'
      where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
    when 'today'
      where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    else
      all
    end
  } 

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { where(archived: false) }
end
