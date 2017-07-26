require 'bitmap'

describe Bitmap do

  context "One line output" do
    it "renders a white (O) table at coordinates 1,1" do
      parameters = ["I", 1, 1]
      subject = Bitmap.new(parameters)
      subject.paint
      expect(subject.output_array).to eq ["O"]
    end
  end

  context "Two line output" do
    it "renders a white (O) table at coordinates 2,2" do
      parameters = ["I", 2, 2]
      subject = Bitmap.new(parameters)
      subject.paint
      expect(subject.output_array).to eq ["OO","OO"]
    end
  end

end
