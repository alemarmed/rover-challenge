module Rovers
  class Squad
    def initialize(input)
      @input = input.dup
      @squad = []
    end

    def deploy!
      raise Errors::InvalidInput unless validate_input

      @size_x, @size_y = @input.shift.map(&:to_i)
      @input.each_slice(2).each { |rover_input| @squad << deploy_rover!(rover_input[0], rover_input[1]) }
    end

    def status
      @squad.map(&:status)
    end

    private

    def validate_input
      @input.size > 1 && @input.size.odd? && @input[0].size == 2 && @input[0].all? { |i| i.to_i > 0 }
    end

    def deploy_rover!(initial_status, commands)
      rover = Robot.new(*initial_status)
      commands.each do |code|
        rover.command(code)
        validate_rover_status!(rover)
      end
      rover
    end

    def validate_rover_status!(rover)
      raise Errors::LeavingPlateau if out_of_limits(rover)
      raise Errors::Collision if @squad.any? { |member| member.cx == rover.cx && member.cy == rover.cy }
    end

    def out_of_limits(rover)
      rover.cx < 0 || rover.cy < 0 || rover.cx > @size_x || rover.cy > @size_y
    end
  end
end
