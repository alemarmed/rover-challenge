require "test_helper"

class SquadTest < Minitest::Test
  def test_squad_output
    squad = ::Rovers::Squad.new(INPUT_1)
    squad.deploy!
    assert_equal [[1, 3, "N"], [5, 1, "E"]], squad.status
  end

  def test_invalid_input
    assert_raises ::Rovers::Errors::InvalidInput do
      squad = ::Rovers::Squad.new(INPUT_1.take(2))
      squad.deploy!
    end
  end

  def test_invalid_plateau
    assert_raises ::Rovers::Errors::InvalidInput do
      squad = ::Rovers::Squad.new([["c", 7], [1, 2, "N"], ["M"]])
      squad.deploy!
    end
  end

  def test_plateau_limits
    assert_out_of_plateau [[2, 2], [1, 2, "N"], ["M"]]
    assert_out_of_plateau [[2, 2], [0, 0, "S"], ["M"]]
  end

  def test_rovers_collision
    assert_raises ::Rovers::Errors::Collision do
      squad = ::Rovers::Squad.new(COLLISION_INPUT)
      squad.deploy!
    end
  end

  private

  def assert_out_of_plateau(input)
    assert_raises ::Rovers::Errors::LeavingPlateau do
      squad = ::Rovers::Squad.new(input)
      squad.deploy!
    end
  end
end
