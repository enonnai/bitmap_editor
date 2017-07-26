require 'bitmap'

describe Bitmap do

  context "One line output" do
    it "creates a white (O) table at coordinates 1,1" do
      parameters = ["I", 1, 1]
      subject = Bitmap.new(parameters)
      subject.create_table
      expect(subject.table).to eq ["O"]
    end
  end

  context "Two line output" do
    it "creates a white (O) table at coordinates 2,2" do
      parameters = ["I", 2, 2]
      subject = Bitmap.new(parameters)
      subject.create_table
      expect(subject.table).to eq ["OO","OO"]
    end
  end

  context "Color a pixel" do
    it "colors a pixel from the table with a specified color" do
      parameters = ["I", 2, 2]
      subject = Bitmap.new(parameters)
      subject.create_table
      second_parameters = ["L", 1, 2, "A"]
      subject.color_pixels(second_parameters)
      expect(subject.table).to eq ["OO","AO"]
    end
  end

end
