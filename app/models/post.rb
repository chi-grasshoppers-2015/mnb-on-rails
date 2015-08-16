class Post < ActiveRecord::Base

  def post_date
    self.created_at.strftime("%-m/%-d")
  end
end
