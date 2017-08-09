require 'bitmap_editor'

describe BitmapEditor do
  it "reads the input from a text file and returns a bitmap" do
    file = 'examples/show.txt'
    bitmap_editor = BitmapEditor.new
    expect(bitmap_editor.run(file)).to eq ["OOOOO", "OOZZZ", "AWOOO", "OWOOO", "OWOOO", "OWOOO"]
  end
end
