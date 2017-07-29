require 'bitmap'

describe Bitmap do

  context "One line output" do
    it "creates a white (O) table at coordinates 1,1" do
      params = ["I", 1, 1]
      subject = Bitmap.new(params)
      subject.create_table
      expect(subject.table).to eq ["O"]
    end
  end

  context "Two line output" do
    it "creates a white (O) table at coordinates 2,2" do
      params = ["I", 2, 2]
      subject = Bitmap.new(params)
      subject.create_table
      expect(subject.table).to eq ["OO","OO"]
    end
  end

  context "Color a pixel" do
    it "colors a pixel from the table with a specified color" do
      params = ["I", 2, 2]
      subject = Bitmap.new(params)
      subject.create_table
      second_params = ["L", 1, 2, "A"]
      subject.color_pixels(second_params)
      expect(subject.table).to eq ["OO","AO"]
    end
  end

  context "Draw a vertical segment" do
    it "draws a vertical segment of a specified colour" do
      params = ["I", 5, 6]
      subject = Bitmap.new(params)
      subject.create_table
      p subject.table
      vertical_seg_params = ["V", 2, 3, 6, "B"]
      subject.draw_vertical_seg(vertical_seg_params)
      expect(subject.table).to eq ["OOOOO","OOOOO", "OBOOO","OBOOO", "OBOOO", "OBOOO"]
    end
  end

  context "Draw a horizontal segment" do
    it "draws a horizontal segment of a specified colour" do
      params = ["I", 5, 6]
      subject = Bitmap.new(params)
      subject.create_table
      p subject.table
      horizontal_seg_params = ["H", 3, 5, 2, "C"]
      subject.draw_horizontal_seg(horizontal_seg_params)
      expect(subject.table).to eq ["OOOOO","OOCCC", "OOOOO","OOOOO", "OOOOO", "OOOOO"]
    end
  end

  context "Clear the table" do
    it "clears the table, setting all pixels to white" do
      params = ["I", 5, 6]
      subject = Bitmap.new(params)
      subject.create_table
      horizontal_seg_params = ["H", 3, 5, 2, "C"]
      subject.draw_horizontal_seg(horizontal_seg_params)
      p subject.table
      subject.clear_table
      expect(subject.table).to eq ["OOOOO","OOOOO", "OOOOO","OOOOO", "OOOOO", "OOOOO"]
    end
  end

  context "Show contents" do
    it "shows the contents of the current image" do
      params = ["I", 5, 6]
      subject = Bitmap.new(params)
      subject.create_table
      horizontal_seg_params = ["H", 3, 5, 2, "C"]
      subject.draw_horizontal_seg(horizontal_seg_params)
      subject.show
      expect(subject.show).to eq ["OOOOO","OOCCC", "OOOOO","OOOOO", "OOOOO", "OOOOO"]
    end
  end

end
