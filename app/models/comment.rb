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
class CommentValidator < ActiveModel::Validator
  def validate(record)
    if record.commenter?
      if record.commenter.length < 5
        record.errors.add(:commenter, "Should at have 5 characters at least")
      end
      if record.commenter =~ /\A[[:lower:]]/
        record.errors.add(:commenter, "Should start with capital letter")
      end
    else
      record.errors.add(:commenter, "Should be present")
    end
    if record.body?
      if record.body.length < 5 || record.body.length > 100
        record.errors.add(:body, "Should have length in range 5 to 100")
      end
    else
      record.errors.add(:body, "Should be present")
    end
  end
end


class Comment < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :article
  validates_with CommentValidator
end
