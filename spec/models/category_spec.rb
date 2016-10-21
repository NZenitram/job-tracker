require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new(city: "Denver")
        expect(company).to be_invalid
      end
    end

    context "unique attributes" do
      it "has a unique name" do
        Company.create(name: "Dropbox", city: "Denver")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end
  end

end
