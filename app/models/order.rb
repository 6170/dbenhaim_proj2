class Order
  include Mongoid::Document
  field :state, type: String
  belongs_to :user
  has_many :items
end