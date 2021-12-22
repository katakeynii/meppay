require 'rails_helper'
module MepPay
  RSpec.describe MepPay::TransactionsController, type: :request do
    describe "POST /transactions" do
      let(:base_error_message)	{ "param is missing or the value is empty:" }
      it "require presence of param montant" do
        post "/mep_pay/transactions"
        expect(response.body).to include("#{base_error_message} montant") 
      end

      it "require presence of purchase type params" do
        post "/mep_pay/transactions", params: { montant: 100000 }
        expect(response.body).to include("#{base_error_message} purchase_type")
      end

      it "require presence of purchase type params" do
        post "/mep_pay/transactions", params: { montant: 100000, purchase_type: "UnknowModel" }
        expect(response.body).to include("#{base_error_message} purchase_id")
      end
      # it ""
      context "when all params are given" do
        before do 
          MepPay::Dummy::Declaration.create! title: "Declaration Juin 2021"
        end
        
        context "with invalid purchase type" do
          let(:params)	{ { montant: 100000, purchase_id: 2, purchase_type: "UnknowModel" } }
          it "should know the existence of the purchase model" do 
            post "/mep_pay/transactions", params: params
            expect(response).to have_http_status(:bad_request)
          end
        end
  
        context "with valid purchase type" do
          let!(:references) {FactoryBot.create_list("mep_pay/reference", 10)} 
          it "require montant to equal sum of total recette" do 
            params = { 
              montant: 0, 
              purchase_id: 1, 
              purchase_type: "MepPay::Dummy::Declaration" , 
              recettes: [
                {code: "01", montant:  1000}, 
                {code: "02", montant:  1000}
              ]
            }
            post "/mep_pay/transactions", params: params
            expect(response.body).to include("Le montant doit etre egal au total des recettes")
            expect(response).to have_http_status(:bad_request)
          end
  
          context "with references" do 
            let!(:data_references) {FactoryBot.create_list("mep_pay/reference", 10)} 

            let!(:references) {
              data_references
              .sample(4)
              .pluck(:code)
              .map{|code| {code: code, value: "Value #{code}"} }
            }
            it "create the transaction" do 
              params = { 
                montant: 2000, 
                purchase_id: 1, 
                purchase_type: "MepPay::Dummy::Declaration" , 
                recettes: [
                  {code: "01", montant:  1000}, 
                  {code: "02", montant:  1000}
                ],
                references: references
              }
              post "/mep_pay/transactions", params: params
              last_inserted = MepPay::Transaction.last 
              expect(last_inserted.reference_values.size).to eq(4)
              expect(last_inserted.references.pluck(:code)).to include(*references.map {|c| c[:code]})
              expect(response).to have_http_status(302)
            end
          end

          context "without references" do 
            it "create the transaction" do 
              params = { 
                montant: 2000, 
                purchase_id: 1, 
                purchase_type: "MepPay::Dummy::Declaration" , 
                recettes: [
                  {code: "01", montant:  1000}, 
                  {code: "02", montant:  1000}
                ]
              }
              post "/mep_pay/transactions", params: params
              last_inserted = MepPay::Transaction.last 
              expect(last_inserted.montant).to eq(2000)
              expect(last_inserted.typable.id).to be(1)
              expect(last_inserted.typable_type).to eq("MepPay::Dummy::Declaration")
              expect(last_inserted.transaction_lines.size).to be(2)
              expect(response).to have_http_status(302)
            end
          end
  
        end
      end
    end
  end
end
