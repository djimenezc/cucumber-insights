class Metadata
  attr_reader :username, :password, :url

  def initialize(username, password, url)
    @username = username
    @password = password
    @url = url
  end

  def set_customer_data(customer_id, data)
    customer_data = {}

    data.each do |key, value|
      customer_data["customer[#{key}]"] = value
    end

    self.put_config("/customers/#{customer_id}", customer_data)
  end

  def put_config(relative_url, config={})
    #when editing via rest, we must set the method to put
    config.merge!({:_method => "PUT"})

    #make an http connection to metadata
    url = URI.parse("#{@url}#{URI.encode(relative_url)}")

    req = Net::HTTP::Post.new(url.path)
    req.basic_auth(@username, @password)
    req.set_form_data(config)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if @url =~ /^https/
    res = http.request(req)



    if res.code == "200"

    else

    end
  end
end