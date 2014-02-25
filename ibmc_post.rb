#!/usr/bin/ruby

require 'logger'

class IbmConnections

  def initialize (username, password)
    @username = "<put your username here>"
    @password = "<put your password here>"
  end

  def post_status_message
    require 'rest_client'
    atom  = "
    <entry xmlns='http://www.w3.org/2005/Atom'>
    <title type='text'>Hi there 012</title>
    <category term='entry' scheme='http://www.ibm.com/xmlns/prod/sn/type' />
    <category term='status' scheme='http://www.ibm.com/xmlns/prod/sn/message-type' />
    <content type='text'>Testing Connect My Tweet! to make sure it works with the new version of Connections #connectmytweet</content>
    </entry>"

    begin
      url  = "https://greenhouse.lotus.com/profiles/atom/mv/theboard/entry/status.do"
      resource = authenticate url, @username, @password
      response = resource.put atom, :content_type => 'application/atom+xml'
      if response.empty?
        return {:success => 'true', :message => "Successfully update your status!", :data => atom}
      else
        return {:success => 'false', :message => "Error1 occurred while posting to Connections! <br /> Please contact the administrator.", :data => atom}
      end
    rescue => error
      print "Error: IbmConnections.post_it_connections(2)"
      print error.inspect
      return {:success => 'false', :message => "Error2 occurred while posting to Connections! <br /> Please contact the administrator.", :data => error.inspect}
    end
  end

  def authenticate url, username, password
    auth = 'Basic ' + Base64.strict_encode64("#{username}:#{password}")
    RestClient::Resource.new(url, { :headers => { 'Authorization' => auth } } )
  end
end

connections=IbmConnections.new("a", "b")
response=connections.post_status_message
print response
