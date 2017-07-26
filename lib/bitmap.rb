class Bitmap
  attr_reader :table

  def initialize(parameters)
    @parameters = parameters
    @table = []
  end

  def create_table
      @table << "O" * @parameters[1]
      @table << "O" * @parameters[2] unless @parameters[2] == 1
  end

  def color_pixels(coordinates_and_colour)
    @table[coordinates_and_colour[2]-1][coordinates_and_colour[1]-1] = coordinates_and_colour[3]
  end

end
