require 'rails_helper'



#Only validates:first_name, uniqueness: { scope: [ :last_name, :birthday ] }
RSpec.describe Student, type: :model do

  describe "validations" do
    it "fails to save" do
      studenspec = Student.new

      studenspec.save

      expect(studenspec).to_not be_persisted
    end

    it "validate birthday" do
      studenspec = Student.new(first_name: "Maximiliano", last_name: "Hernández")

      studenspec.save

      expect(studenspec.errors.full_messages).to eq(["birthday necessary"])
    end

    it "validate first_name" do
      studenspec = Student.new(last_name: "Hernández", birthday: "03/06/1991")

      studenspec.save

      expect(studenspec.errors.full_messages).to eq(["First name necessary"])
    end

    it "validate last_name" do
      studenspec = Student.new(first_name: "Maximiliano",birthday: "03/06/1991")

      studenspec.save

      expect(studenspec.errors.full_messages).to eq(["Last name necessary"])
    end

    it "Validates uniqueness of first name" do
      Student.create(first_name: "Maximiliano",
                  last_name: "Hernández",
                  birthday:"03/06/1991")

      studenspec = Student.new(first_name: "Maximiliano",
                  last_name: "Hernández",
                  birthday:"03/06/1991")

      studenspec.save

      expect(studenspec.errors.full_messages).to eq(["First name saved"])
    end
  end
end
