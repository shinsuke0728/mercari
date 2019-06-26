class Category < ApplicationRecord
  has_many :items_categories, dependent: :destroy
  has_many :items, through: :items_categories

  belongs_to :parent, class_name: :Category, optional: :true
  has_many :children, class_name: :Category, foreign_key: :parent_id
end
