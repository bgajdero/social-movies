class Comment < ActiveRecord::Base
  def self.search(query)
    Comment.where("body like '%#{query}%'")
  end

end