require "test_helper"

class RobotTest < Minitest::Test
  def test_robot_move_north
    robot = ::Rovers::Robot.new(1, 1, "N")
    robot.move
    assert [1, 2, "N"], robot.status
  end

  def test_robot_move_east
    robot = ::Rovers::Robot.new(1, 1, "E")
    robot.move
    assert [2, 1, "E"], robot.status
  end

  def test_robot_move_south
    robot = ::Rovers::Robot.new(1, 1, "S")
    robot.move
    assert_equal [1, 0, "S"], robot.status
  end

  def test_robot_move_west
    robot = ::Rovers::Robot.new(1, 1, "W")
    robot.move
    assert_equal [0, 1, "W"], robot.status
  end

  def test_robot_turn_left
    robot = ::Rovers::Robot.new(0, 0, "N")
    assert_turn_left_to(robot, "W")
    assert_turn_left_to(robot, "S")
    assert_turn_left_to(robot, "E")
    assert_turn_left_to(robot, "N")
  end

  def test_robot_turn_right
    robot = ::Rovers::Robot.new(0, 0, "N")
    assert_turn_right_to(robot, "E")
    assert_turn_right_to(robot, "S")
    assert_turn_right_to(robot, "W")
    assert_turn_right_to(robot, "N")
  end

  def test_execute_commands
    robot = ::Rovers::Robot.new(0, 0, "N")
    %w[M R M L M L].each { |code| robot.command(code) }
    assert_equal [1, 2, "W"], robot.status
  end

  def test_not_allowed_command
    robot = ::Rovers::Robot.new(0, 0, "N")
    assert_raises ::Rovers::Errors::UnknownCommand do
      robot.command("x")
    end
  end

  private

  def assert_turn_left_to(robot, expected_dir)
    assert_equal expected_dir, robot.turn_left.direction
  end

  def assert_turn_right_to(robot, expected_dir)
    assert_equal expected_dir, robot.turn_right.direction
  end
end
