#!/usr/local/bin/ruby
require 'ipaddr'

def scan_line(line)
  words = line.gsub(/(?<open>[\(\{\[])(?<ip>[0-9a-fA-F\.\/]+)(?<close>[\)\}\]])/, ' \k<open> \k<ip> \k<close>').split(' ')
  output = words.map do |word|
    begin
      ipaddr = IPAddr.new(word)
      # whois_result = `whois -h jpirr.nic.ad.jp #{ipaddr} | grep "^origin"`.chomp
      whois_result = `whois -h whois.radb.net #{ipaddr} | grep "^origin"`.chomp
      as_arr = []
      whois_result.each_line do |line|
        as_arr << line.split(' ')[1]
      end
      as = ( as_arr.uniq.size>1 ?  as_arr[0]+'*' : as_arr[0] )
      if (/^AS/ =~ as)
#        replacement = sprintf("%-#{word.bytesize}s", "[#{as}]")
        replacement = sprintf("%s", "[#{as}]")
      else
        replacement = word
      end
      replacement
    rescue IPAddr::InvalidAddressError
      word
    end
  end
  puts output.join(' ')
end

if !ARGV[0].nil?
  line = ARGV.join(' ')
  scan_line(line)
else
  while line = gets
    scan_line(line)
  end
end
