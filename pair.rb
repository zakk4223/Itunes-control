#!/usr/bin/env ruby

require 'rubygems'
require 'webrick'
require 'net/dns/mdns-sd'
require 'daap'


#we need to override the HTTPResponse to not mangle header case
module WEBrick
  class HTTPResponse
    def []=(field, value)
       @header[field] = value.to_s
     end

     def [](field)
          @header[field]
      end
      def send_body(socket)
        case @body
        when IO, File then
          send_body_io(socket)
          puts "SEND BODY IO"
        else send_body_string(socket)
        end
      end
  end
end

class Servlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    
    
    response['Content-Type'] = 'application/x-dmap-tagged'
    response.status = 200
    cmpa = DAAP::Protocol::Tag.new('cmpa')
    cmpa.cmnm 'TestPairRemote'
    cmpa.cmty  'ipod'
    cmpa.cmpg  2
    response.body = cmpa.to_s
  end

end


DNSSD = Net::DNS::MDNSSD
DNSSD.register('testpair', '_touch-remote._tcp', 'local', 7676, {'DvNm' => 'TestPairRemote', 'RemV' => '10000', 'DvTy' => 'iPhone', 'RemN' => 'Remote', 'txtvers' => '1', 'Pair' => '0000000000000002'})

pair_server = WEBrick::HTTPServer.new(:Port => 7676)
pair_server.mount "/pair", Servlet
trap "INT" do pair_server.shutdown end
pair_server.start


