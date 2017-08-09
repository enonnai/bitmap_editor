require_relative './lib/bitmap.rb'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    bitmap = nil

    File.open(file).each do |line|
      line = line.chomp
      case line
      when /^I/
        params = line.split[1..-1]
        params.map! { |i| i.to_i }
        bitmap = Bitmap.new(params)
        bitmap.create_table
      when /^L/
        params = line.split[1..-1]
        params[0] = params[0].to_i
        params[1] = params[1].to_i
        bitmap.color_pixels(params)
      when /^V/
        params = line.split[1..-1]
        params[0] = params[0].to_i
        params[1] = params[1].to_i
        params[2] = params[2].to_i
        bitmap.draw_vertical_seg(params)
      when /^H/
        params = line.split[1..-1]
        params[0] = params[0].to_i
        params[1] = params[1].to_i
        params[2] = params[2].to_i
        bitmap.draw_horizontal_seg(params)
      when /^C/
        bitmap.clear_table
      when /^S/
        if bitmap
          return bitmap.show
        else
          'There is no image to show'
        end
      else
        'unrecognised command :('
      end
    end
  end
end
