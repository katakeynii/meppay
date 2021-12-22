namespace :seed do
  desc "TODO"
  task references: :environment do
    MepPay::Reference.delete_all
    references = [
      { code: "01", libelle: "Nom" },
      { code: "02", libelle: "Prenom" },
      { code: "03", libelle: "Raison sociale" },
      { code: "04", libelle: "Téléphone" },
      { code: "05", libelle: "Email" },
      { code: "06", libelle: "CNI" },
      { code: "07", libelle: "Ninea" },
      { code: "20", libelle: "IBAN" }
    ]
    references.each do |ref|
      MepPay::Reference.create! ref
    end
  end

end
