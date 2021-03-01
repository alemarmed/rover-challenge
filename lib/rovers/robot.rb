module Rovers
  class Robot
    attr_reader :cx, :cy, :direction

    def initialize(x_init, y_init, direction)
      @cx = x_init.to_i
      @cy = y_init.to_i
      @direction = direction
    end

    def status
      [@cx, @cy, @direction]
    end

    def command(code)
      case code
      when "M"
        move
      when "L"
        turn_left
      when "R"
        turn_right
      else
        raise Errors::UnknownCommand, code
      end
    end

    def move
      case @direction
      when "N"
        @cy += 1
      when "E"
        @cx += 1
      when "S"
        @cy -= 1
      when "W"
        @cx -= 1
      end
      self
    end

    def turn_left
      rotate %w[N W S E N]
      self
    end

    def turn_right
      rotate %w[N E S W N]
      self
    end

    private

    def rotate(sorted_dirs)
      @direction = sorted_dirs[sorted_dirs.index(@direction) + 1]
    end
  end
end
