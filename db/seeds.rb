# coding: utf-8
require "csv"

CSV.foreach('db/prefecture.csv', headers: true) do |row|
  Prefecture.find_or_create_by(id: row['id'],
                  prefecture_name: row['prefecture_name']
                  )
end

CSV.foreach('db/brand.csv', headers: true) do |row|
  Brand.find_or_create_by(id: row['id'],
                brand_name: row['brand_name']
              )
end

CSV.foreach('db/category.csv', headers: true) do |row|
  Category.find_or_create_by(id: row['id'],
                  category_name: row['category_name'],
                  parent_id: row['parent_id']
                  )
end

CSV.foreach('db/size.csv', headers: true) do |row|
  Size.find_or_create_by(id: row['id'],
              size_name: row['size_name'],
              parent_id: row['parent_id']
              )
end
