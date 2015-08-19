Camping.goes :Nuts

module Nuts::Controllers
  class Index < R '/'
    def get
      @time = Time.now
      render :sundial
    end
  end
end

module Nuts::Views
  def layout
    html do
      head do
        title { "Nuts And GORP" }
      end
      body { self << yield }
    end
  end
  
  def sundial
    p "The current time is: #{@time}"
  end
end

module Nuts::Controllers
  class Words < R '/welcome/to/my/site'
    def get
      "You got here by: /welcome/to/my/site"
    end
  end
  
  class Digits < R '/nuts/(\d+)'
    def get(number)
      "You got here by: /nuts/#{number}"
    end
  end
  
  class Segment < R '/gorp/([^/]+)'
    def get(everything_else_than_a_slash)
      "You got here by: /gorp/#{everything_else_than_a_slash}"
    end
  end
  
  class DigitsAndEverything < R '/nuts/(\d+)/([^/]+)'
    def get(number, everything)
      "You got here by: /nuts/#{number}/#{everything}"
    end
  end
end