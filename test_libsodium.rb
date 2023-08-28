require 'rbnacl'
require_relative 'customization'

puts "#{Customization::COLORS[:red]}[testsodium]#{Customization::FORMATS[:reset]} " +
     "#{Customization::COLORS[:yellow]}Requesting random public & private keypairs to test Libsodium.#{Customization::FORMATS[:reset]}"

begin
  keypair = RbNaCl::Signatures::Ed25519::SigningKey.generate

  public_key_text = Customization.color_text(keypair.verify_key.to_s.unpack1('H*'), :bold)
  private_key_text = Customization.color_text(keypair.to_s.unpack1('H*'), :bold)

  puts "Public Key: #{public_key_text}"
  puts "Private Key: #{private_key_text}"
rescue StandardError => e
  error_message = "#{Customization::COLORS[:red]}An error occurred while generating the keypairs.#{Customization::FORMATS[:reset]}"
  puts "#{Customization::COLORS[:blue]}[cmdchat]#{Customization::FORMATS[:reset]} #{error_message}"
end

success_message = "#{Customization::COLORS[:green]}Test keypairs generated successfully.#{Customization::FORMATS[:reset]}"
puts "#{Customization::COLORS[:blue]}[cmdchat]#{Customization::FORMATS[:reset]} #{success_message}"
