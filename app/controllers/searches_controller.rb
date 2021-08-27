class SearchesController < ApplicationController
  def search
    @custom = params["custom"]
    @body = params["body"]
    @option = params["option"]
    @records = search_for(@custom, @body, @option)
  end

  private
  def search_for(custom, body, option)
    if custom == 'User'
      if option == 'perfect'
        User.where(name: body)
      elsif option == "forward"
        User.where('name LIKE ?', "#{body}%")
      elsif option == "backword"
        User.where("name LIKE ?" "%#{body}")
      elsif option == "partial"
        User.where("name LIKE ?" "%#{body}%")
      end
    elsif custom == 'Book'
      if option == 'perfect'
        Book.where(body: body)
      elsif option == "forward"
        Book.where('body LIKE ?', "#{body}%")
      elsif option == "backword"
        Book.where('body LIKE ?', "%#{body}")
      elsif option == "forward"
        Book.where('body LIKE ?', "%#{body}%")
      end
    end
  end
end
