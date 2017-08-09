class Bitmap
  attr_reader :table

  def initialize(parameters)
    @parameters = parameters
    @table = []
  end

  def create_table
      @parameters[1].times do
        @table << "O" * @parameters[0]
      end
  end

  def color_pixels(coordinates_and_colour)
    @table[coordinates_and_colour[1]-1][coordinates_and_colour[0]-1] = coordinates_and_colour[2]
  end

  def draw_vertical_seg(vertical_seg_params)
    colour = vertical_seg_params[3]
    start = vertical_seg_params[1]
    finish = vertical_seg_params[2]
    column = vertical_seg_params[0]

    i = start
    while i <= finish
      @table[i-1][column-1] = colour
      i += 1
    end
  end

  def draw_horizontal_seg(horizontal_seg_params)
    colour = horizontal_seg_params[3]
    start = horizontal_seg_params[0]
    finish = horizontal_seg_params[1]
    row = horizontal_seg_params[2]

    i = start
    while i <= finish
      @table[row-1][i-1] = colour
      i += 1
    end
  end

  def clear_table
    @table.clear
    @parameters[1].times do
      @table << "O" * @parameters[0]
    end
  end

  def show
    @table
  end

end
