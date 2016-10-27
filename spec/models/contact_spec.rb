require 'rails_helper'

describe Contact do
  describe "validations" do
    it "is invalid without a name" do
      contact = Contact.new(position: "IT", email: "jdoe@gmail.com", company_id: 1)

    expect(contact).to be_invalid
    end
  end

  describe "validations" do
    it "is invalid without a position" do
      contact = Contact.new(full_name: "Jon Doe" , email: "jdoe@gmail.com", company_id: 1)

    expect(contact).to be_invalid
    end
  end

  describe "validations" do
    it "is invalid without an email" do
      contact = Contact.new(full_name: "Jon Dow", position: "IT", company_id: 1)

    expect(contact).to be_invalid
    end
  end

  describe "validations" do
    it "is invalid without a company_id" do
      contact = Contact.new(full_name:  "Jon Doe" , position: "IT", email: "jdoe@gmail.com" )

    expect(contact).to be_invalid
    end
  end
end
