require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  # describe # is refer to instance method
  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        cookie.type.should eq(type)
      end
    end

  # this control the output must provide an argument
    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)
      end
    end
  end

  # the attr_reader : type handle this
  describe "#type" do
    it "returns the type of the cookie" do
      expect(cookie.type).to eq("peanut butter")
    end
  end

  # this control the output must provide argument, argument must be integer, and same value as cookie object
  describe "#bake!" do
    it "requires an integer time argument" do
      expect{cookie.bake!}.to raise_error(ArgumentError)
      expect{cookie.bake!("1")}. to raise_error(TypeError)
      end
    it "returns the cookie object" do
      expect(cookie.bake!(2)).to eq(cookie)
    end
    # this control the output by execute the block of code that change the state of a object
    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
      # expect { cookie.bake!(10) }.to change{cookie.status}
    end
  end

  describe "#status" do
    it "returns the cookie's current status" do
      expect(cookie.status). to eq(:doughy)
      end
    context "when unbaked" do
      it "is `:doughy`" do
      cookie.bake!(0)
      expect(cookie.status). to eq(:doughy)
      end
    end

    context "when baked for less than 7 minutes" do
      it "is `:doughy`" do
        cookie.bake!(6)
        expect(cookie.status).to eq(:doughy)
      end
    end  

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do 
        cookie.bake!(9)
        expect(cookie.status).to eq(:almost_ready)
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do 
        cookie.bake!(11)
        expect(cookie.status).to eq(:ready)
      end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do 
        cookie.bake!(12)
        expect(cookie.status).to eq(:burned)
      end
    end
  end
end