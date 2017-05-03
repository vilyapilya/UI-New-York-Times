require 'json'
require 'byebug'
class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies["_rails_lite_app"]
    if cookie
      @hash = JSON.parse(cookie.to_s)
    else
      @hash = {}
    end

  end

  def [](key)
    @hash[key]
  end
  def []=(key, val)
    @hash[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = { path: "/", value: @hash.to_json }
    res.set_cookie(cookie)
  end
end
