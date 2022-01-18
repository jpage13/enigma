require 'date'
require './lib/enigma'
require './lib/file_accessor'

include FileAccessor

secret_message = reader(ARGV[0])

enigma = Enigma.new
secret_encryption = enigma.encrypt(secret_message)

cryption = secret_encryption[:encryption]
key = secret_encryption[:key]
date = secret_encryption[:date]

writer(cryption, ARGV[1])

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"
