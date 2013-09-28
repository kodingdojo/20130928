require 'digest/hmac'
require 'digest/sha1'
require 'net/http'
require 'sinatra'

class AuthService

  def initialize(server_addr)
    @server_addr = server_addr
  end

  def compute_preauth(name, time_st, authkey)
    plaintext = "#{name}|name|0|#{time_st}"
    key = authkey

    hmacd = Digest::HMAC.new(key, Digest::SHA1.new)
    hmacd.update(plaintext)
    return "https://#{@server_addr}/service/preauth?account=#{name}&expire=0&timestamp=#{time_st}&preauth=#{hmacd.to_s}"
  end

  def check_credential (username, password)
    uri = URI("https://#{@server_addr}/home/#{username}/inbox.json?auth=ba")

    req = Net::HTTP::Get.new(uri)
    req.basic_auth username, password

    begin
        res = Net::HTTP.start(uri.hostname, uri.port,
            :use_ssl => uri.scheme == 'https',
            :verify_mode => 0) {|http|
          http.request(req)
        }
    rescue Timeout::Error
        return false
    end

    res.code == '200'
  end
end

authService = AuthService.new("192.168.100.18:8001")

get '/login/:username/:password' do
  username = params[:username]
  password = params[:password]

  if authService.check_credential username, password
    authService.compute_preauth username,
      Time.now.to_i * 1000,
      "9d53bedd24e1c837f3124a7c029f427594463eb33c649e58036fde9514a8d9ad"
  else
      "Wrong username or password!"
  end
end
