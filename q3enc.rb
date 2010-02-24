#!/usr/bin/env ruby -wKu

ALPHA="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
ALPHA_ZIP="RSTUVWXYZABCDEFGHIJKLMNOPQ"

s_al = ALPHA.downcase
s_al_zip = ALPHA_ZIP.downcase
l_al = ALPHA
l_al_zip = ALPHA_ZIP


while line=gets
    line.chomp!
    output = []
    line.each_char do |c|
        si = s_al.index(c)
        li = l_al.index(c)
        if si != nil 
            oc = s_al_zip[si]
        elsif li != nil
            oc = l_al_zip[li]
        else
            oc = c.unpack("C*")[0]
        end
        output << oc.chr
    end
    puts output.to_s
end

