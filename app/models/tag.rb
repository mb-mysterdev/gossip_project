class Tag < ApplicationRecord
  has_many :join_table_gossips_tags
  has_many :comments, through: :join_table_gossips_tags
end
