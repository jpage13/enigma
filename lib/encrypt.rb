require 'date'
require './lib/enigma'
require './lib/fileable'

include FileAccessor

message = reader(ARGV[0])
enigma = Enigma.new
secret_encryption = enigma.encrypt(secret)

encryption = secret_encryption[:encryption]
key = secret_encryption[:key]
date = secret_encryption[:date]

writer(encryption, ARGV[1])

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
