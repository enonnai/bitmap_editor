class Bitmap
  attr_reader :output_array

  def initialize(parameters)
    @parameters = parameters
    @output_array = []
  end

  def paint
    if @parameters[0] == "I"
      @output_array << "O" * @parameters[1]
      @output_array << "O" * @parameters[2] unless @parameters[2] == 1
    end
  end

end
