class Forum < ActiveRecord::Base
  attr_accessible :name, :key, :remote_url
  
  def self.load_comments(forums)
    forums.each do |forum|
      url = "http://disqus.com/api/3.0/forums/listPosts.json?api_key=#{Network.disqus_key}&forum=#{forum.key}&related=thread&order=asc&limit=100"
      response = HTTParty.get url

      comments =  response.parsed_response['response']
      if comments.nil?
        comments = []
      elsif comments.is_a?(String)
        # disqus sent back an error instead of a JSON result
        raise comments.to_s
      end

      comments.each do |chash|
        key = chash['id']
        unless (comment = Comment.find_by_key(key))
          comment = Comment.new
          comment.key = key
          comment.forum = chash['forum']
          comment.remote_url = chash['url']
          comment.parent_key = chash['parent']
          comment.body = chash['message']
          comment.from = chash['author']['id']
          comment.save
        end
      end
    end
    
  end
  
  def self.trending_threads
    url = "http://disqus.com/api/3.0/trends/listThreads.json?api_key=#{Network.disqus_key}&related=forum&related=author&related=category&limit=10"

    response = HTTParty.get url

    threads =  response.parsed_response['response']
    if threads.nil?
      threads = []
    elsif threads.is_a?(String)
      # disqus sent back an error instead of a JSON result
      raise threads.to_s
    end
    forums = []
    threads.each do |thread|
      thash = thread['thread']
      fhash = thash['forum']
      key = fhash['id']
      name = fhash['name']
      url = fhash['url']
      unless (forum = Forum.find_by_key(key))
        forum = Forum.create(:key=>key, :name => name, :remote_url => url)
      end
      forums << forum
    end
    
    forums
  end
end