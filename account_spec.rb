require "rspec"

require_relative "account"

describe Account do
  let(:acct_number) { "1234567890" }
  let(:account) { Account.new(acct_number) }

  describe "#initialize" do
    context "with valid account number," do
      it "creates an account with zero starting balance" do
        expect(account.transactions).to eq 0
      end
    end

    context "with invalid account number," do
      it "raises invalid account number error" do
        expect { Account.new("1234") }.to raise_error(InvalidAccountNumberError)
      end
    end
  end

  describe "#transactions" do
    context "in transactions array" do
      it "should save each transaction amount" do
        account.deposit!(100)
        expect(account.transactions[1]).to eq 100
        account.withdraw!(40)
        expect(account.transactions[2]).to eq -40

      end
    end

    context "if balance less than transaction amount" do
      it "should raise overdraft error" do
        expect{account.withdraw!(40)}.to raise_error(OverdraftError)
      end
    end
  end

  describe "#balance" do
    context "with new accounts" do
      it "should be 0" do
        expect(account.balance).to eq 0
      end
    end

    context "after multiple transactions" do
      it "should return actual balance" do
        account.deposit!(100)
        account.withdraw!(50)
        expect(account.balance).to eq(0+100-50)
      end
    end
  end

  describe "#account_number" do
    it "returns hidden numbers with only 4 visible numbers at the end" do
      expect(account.acct_number).to eq("******7890")
    end
  end

  describe "deposit!" do
    context "with invalid deposit amount" do
      it "raises negative deposit error" do
        expect{account.deposit!(-100)}.to raise_error(NegativeDepositError)
      end
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
        expect(account.balance).to eq 40
      end
    end
  end
end