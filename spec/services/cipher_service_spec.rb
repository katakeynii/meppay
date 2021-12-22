require 'rails_helper'
RSpec.describe CipherService do
    it "" do 
        payload =  '{"refOperation":"123456789","refApp":"002","recettes":[{"codeRecette":"019","montantR
        ecette":"75000"},{"codeRecette":"020","montantRecette":"25000"}],"montantTotal":"100000","natureOperation":"0","natureTransaction":"0","references":[{"code":"01","valeur":
        "Nom"},{"code":"02","valeur":"Prenom"},{"code":"03","valeur":"Raison
        sociale"},{"code":"04","valeur":"Téléphone"},{"code":"05","valeur":"email"},{"code":"06","
        valeur":"CNI"},{"code":"07","valeur":"Ninea"},{"code":"20","valeur":"iban"}]}'.unicode_normalize(:nfkd).encode('ASCII', replace: '')
        crypted = CipherService.call method: :encrypt, payload: payload
        decrypted = CipherService.call method: :decrypt, payload: crypted
        expect(decrypted).to eq(payload)
    end
end