require 'rubygems'
require 'net/https'
require 'nokogiri'

def get(url, options = {})
  request(:get, url, options)
end

def request(method, url, options = {})
  url = URI.parse(url)
  # Make connection to server
  http = Net::HTTP.new(url.host, url.port)
  if url.port == 443
    http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::NO_VERIFY
  end
  # Create request
  req = Net::HTTP::Get.new(url.path)
  req['Accept'] = options.delete(:content_type) if options[:content_type]
  if options[:username] && options[:password]
    req.basic_auth options.delete(:username), options.delete(:password)
  end
  response = nil
  http.start do
    response = http.request req
  end
  return response.body
end

def xpath(data, path)
  doc = Nokogiri.XML(data) { |config| config.strict }
  doc.remove_namespaces!
  nodes = doc.xpath(path)
  return nodes
end