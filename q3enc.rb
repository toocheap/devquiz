#!/usr/bin/env ruby -wKu


while line=gets
    line.chomp!
#    dumped = line.unpack("H*")[0].scan(/[0-9a-f]{2}/)
    dumped = line.unpack("C*")
    p dumped
    mapped = dumped.map { |c| 
        if c >=65 or c <= 90
            c+=17 ; c.chr
        else
            c+=17-25 ; c.chr
        end
    }
    p mapped
end

