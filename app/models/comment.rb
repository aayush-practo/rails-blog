# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string(255)
#  body       :text(65535)
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :article
  validates :commenter, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {in: 5..100}
  validates_each :commenter do |record, attr, value|
    record.errors.add attr, 'Should start with upper case' if value =~ /\A[[:lower:]]/
  end
end
