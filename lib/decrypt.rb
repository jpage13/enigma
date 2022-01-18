require 'date'
require './lib/enigma'
require './lib/file_accessor'

include FileAccessor

secret_message = reader(ARGV[0])

enigma = Enigma.new
secret_decryption = enigma.decrypt(secret_message, ARGV[2], ARGV[3])

cryption = secret_decryption[:decryption]
key = secret_decryption[:key]
date = secret_decryption[:date]

writer(cryption, ARGV[1])

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
