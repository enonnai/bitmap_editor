require_relative './lib/bitmap.rb'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when /^I/
        list_of_commands = File.readlines(file)
        i = 0
        while i < list_of_commands.length do
          if list_of_commands[i][0] == "I"
            params = list_of_commands[0].split[1..-1]
            params.map! { |i| i.to_i }
            bitmap = Bitmap.new(params)
            bitmap.create_table
            i += 1
          elsif list_of_commands[i][0] == "L"
            params = list_of_commands[i].split[1..-1]
            params[0] = params[0].to_i
            params[1] = params[1].to_i
            bitmap.color_pixels(params)
            i += 1
          elsif list_of_commands[i][0] == "V"
            params = list_of_commands[i].split[1..-1]
            params[0] = params[0].to_i
            params[1] = params[1].to_i
            params[2] = params[2].to_i
            bitmap.draw_vertical_seg(params)
            i += 1
          elsif list_of_commands[i][0] == "H"
            params = list_of_commands[i].split[1..-1]
            params[0] = params[0].to_i
            params[1] = params[1].to_i
            params[2] = params[2].to_i
            bitmap.draw_horizontal_seg(params)
            i += 1
          elsif list_of_commands[i][0] == "C"
            puts bitmap.clear_table
            i += 1
          elsif list_of_commands[i][0] == "S"
            i += 1
            puts bitmap.show
            exit 1
          end
        end
      when 'S'
        puts 'There is no image to show'
      else
        puts 'unrecognised command :('
      end
    end
  end
end
