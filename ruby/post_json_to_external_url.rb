require 'net/https'

# example:
# post_json_to_external_url("http://example.com", {text: "hello"}.to_json)
def post_json_to_external_url(url, payload)
  uri = URI.parse(url)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true

  req = Net::HTTP::Post.new(uri.request_uri)
  req["Content-Type"] = "application/json"
  req.body = payload
  https.request(req)
end
