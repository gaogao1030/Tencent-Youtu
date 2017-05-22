require 'rest-client'

module Youtu
  module Request
   class << self
     def post(url,payload={},headers={},&block)
       config = RequestConfig.new({
         url: url,
         method: :post,
         payload: payload,
         headers: headers
       }).config
       RestClient::Request.execute(config,&block)
     end
   end

   class RequestConfig
     def initialize(opts={})
       parse_url = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
       opts[:payload].merge!({"app_id": Youtu.config.app_id})
       payload = RestClient::Payload.generate(opts[:payload].to_json)
       @_config = {
         url: Youtu.config.host + opts[:url],
         method: opts[:method],
         payload: payload.read,
         headers: {
           authorization: Youtu::Sign.signature,
           content_type: "text/json",
           content_length: payload.size,
           user_agent: "ua",
           Host: Youtu.config.host.match(parse_url)[3]
         }
       }
       @_config.merge({headers: opts[:headers]})
     end

     def config
       @_config
     end
   end

  end
end
