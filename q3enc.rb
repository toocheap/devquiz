#!/usr/bin/env ruby -wKu
require 'rubygems'
require 'json'
require 'httpclient'

class Q3Enc
    ALPHA="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    ALPHA_ZIP="RSTUVWXYZABCDEFGHIJKLMNOPQ"

    def initialize
        @@s_al = ALPHA.downcase
        @@s_al_zip = ALPHA_ZIP.downcase
        @@l_al = ALPHA
        @@l_al_zip = ALPHA_ZIP
    end

    def encode(line)
        line.chomp!
        output = []
        line.each_char do |c|
            si = @@s_al.index(c)
            li = @@l_al.index(c)
            if si != nil 
                oc = @@s_al_zip[si]
            elsif li != nil
                oc = @@l_al_zip[li]
            else
                oc = c.unpack("C*")[0]
            end
            output << oc.chr
        end
        output.to_s
    end
end

request_uri = 'http://devquiz.appspot.com/personalpost'

result = Hash.new
result[:key] = "da82agdkZXZxdWl6chwLEhRQYXJ0aWNpcGFudFNvbHV0aW9ucxj87AEM"
q3 = Q3Enc.new
result[:pass] = q3.encode 'toocheap@gmail.com'
body = result.to_json
p body

client = HTTPClient.new
res = client.post(request_uri, body)
p res
