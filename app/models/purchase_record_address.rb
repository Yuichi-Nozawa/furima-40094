class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: 'should be 10 to 11 digits' }
    validates :user_id
    validates :item_id
    validates :token, presence: true
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
