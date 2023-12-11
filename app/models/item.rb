class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_cost_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, class_name: 'CategoryId'
  belongs_to :delivery_cost, class_name: 'DeliveryCostId'
  belongs_to :delivery_day, class_name: 'DeliveryDayId'
  belongs_to :region, class_name: 'RegionId'
  belongs_to :status, class_name: 'StatusId'
end