class Metadata
  attr_reader :username, :password, :url

  def initialize(username, password, url)
    @username = username
    @password = password
    @url = url
  end

  def post_config(relative_url, config)
    #make an http connection to metadata
    url = URI.parse("#{@url}#{URI.encode(relative_url)}")

    req = Net::HTTP::Get.new(url.path)
    req.basic_auth(@username, @password)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if @url =~ /^https/
    res = http.request(req)

    if res.code == "200"

    else

    end
  end
end