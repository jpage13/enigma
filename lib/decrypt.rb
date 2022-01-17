require 'date'
require './lib/enigma'
require './lib/fileaccessor'

include FileAccessor

message = reader(ARGV[0])
enigma = Enigma.new
secret_decryption = enigma.decrypt(secret, ARGV[2], ARGV[3])

decryption = secret_decryption[:decryption]
key = secret_decryption[:key]
date = secret_decryption[:date]

writer(decryption, ARGV[1])

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
