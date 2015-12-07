require "rspec"

require_relative "account"

describe Account do

  let(:acct_number) { "88888888"}
  let(:account) {Account.new(account_number)}

  describe "#initialize" do
    context "with valid input" do
      it "create a new account of the specified type" do 
        account.transactions[0]. to eq 0
      end
    end

    context "with invalid input" do 
      it "throws an argument error when not given a type argument" do 
        expect {Account.new("8888")}. to raise_error(ArgumentError)
      end
    end
  end

  describe "#transactions" do
    it "should perform each transaction" do
      account.deposit!(100)
      expect(account.transaction[1]).to eq 100
      account.withdraw!(40)
      expect(account.transactions[2]). to eq -40
    end
  end

  describe "#balance" do
    it "should be 0" do 
      expect(account.balance).to eq 0
    end
  end

  describe "#account_number" do
    it "returns hidden numbers with only 4 visible number at the end" do
      expect(account.acct_number).to eq("****8888")
    end
  end

  describe "deposit!" do
    context "with invalid deposit amount" do
      it "raises negative deposit error" do 
        expct {account.deposit!(-100)}.to raise_error(NegativeDepositError)
      end

      context "with valid deposit amount" do 
        it "returns correct balance" do 
          account.deposit!(100)
          expect(account.balance).to eq 100
        end
      end
  end

  describe "#withdraw!" do
    context "with valid withdrawal amount" do 
      it "returns correct balance" do
        account.deposit!(100)
        account.withdraw!(60)
        expect(account.balance). to eq 40
      end
    end
  end
end