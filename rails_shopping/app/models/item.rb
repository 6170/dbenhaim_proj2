class Item
  include Mongoid::Document
  field :title, type: String
  field :price, type: Float
  field :state, type: String
  field :posted_on, type: Date
  field :ends_on, type: Date
  field :src, type: String
  field :img_src, type: String
  belongs_to :user
  belongs_to :order
  has_and_belongs_to_many :categories
end