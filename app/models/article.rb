# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  has_many :comments, dependent: :nullify
  validates :title, presence: true, length: {minimum: 5, message: "Text should be minimum 5 characters long"}
end
