class CipherService < ApplicationService
    attr_reader :value
    def initialize args
        @payload = args[:payload].unicode_normalize(:nfkd).encode('ASCII', replace: '')
        @method = args[:method]
        @value = nil
    end

    def call 
        self.send("#{@method}")
    end
    
    def to_hash
        JSON.parse(@value).deep_symbolize_keys!
    rescue
        @value
    end
    private


        def bin2hex(str)
            str.unpack('C*').map{ |b| "%02X" % b }.join('')
        end

        def hex2bin(str)
            [str].pack "H*"
        end

        # the encryption 
        def encrypt
            cipher = OpenSSL::Cipher::AES128.new(:CBC)
            cipher.encrypt
            iv =  encrypt_iv
            key =  encrypt_key
            cipher.key = key
            cipher.iv = iv
            encrypted_binary = cipher.update(@payload) + cipher.final
            @value = Base64.encode64 encrypted_binary
            self
        end

        # the decryption
        def decrypt 
            cipher = OpenSSL::Cipher::AES128.new(:CBC)
            cipher.decrypt
            cipher.key = encrypt_key
            cipher.iv = encrypt_iv 
            decoded = Base64.decode64(@payload)
            @value = cipher.update(decoded) + cipher.final
            self
        end

        # Thes methose should call env inof
        def encrypt_key
            ENV.fetch("ENCRYPT_KEY")
        end
        def encrypt_iv
            ENV.fetch("ENCRYPT_IV")
        end
end