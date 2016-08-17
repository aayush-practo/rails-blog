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
  self.table_name = "comm"
  belongs_to :article
  after_create do |user|
    print_a_line(user)
  end
  validates_with CommentValidator

  protected
  def print_a_line(object)
    puts "an object has been created successfully! #{object.as_json}"
  end
end
