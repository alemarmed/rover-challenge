module Rovers
  module Errors
    class UnknownCommand < StandardError
      def initialize(code)
        @code = code
        super
      end

      def message
        "Not allowed command: #{@code}. Allowed commands: L, R, M"
      end
    end

    class InvalidInput < StandardError
      def message
        "Must specify plateau dimensions and the status and a sequence of commands to move each robot"
      end
    end

    class LeavingPlateau < StandardError
      def message
        "Could not move outside the limits of plateau"
      end
    end

    class Collision < StandardError
      def message
        "There was a collision between two robots"
      end
    end
  end
end
