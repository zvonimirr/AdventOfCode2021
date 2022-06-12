defmodule AdventOfCode2021.Day2 do
  def solve(input) do
    Enum.reduce(input, {0, 0}, fn full_command,
                                  {
                                    horizontal,
                                    depth
                                  } ->
      [command, number] = String.split(full_command, " ")
      value = number |> String.to_integer()

      case command do
        "forward" -> {horizontal + value, depth}
        "up" -> {horizontal, depth - value}
        "down" -> {horizontal, depth + value}
      end
    end)
    |> Tuple.product()
  end

  def solve_part2(input) do
    # Horizontal, Depth, Aim
    Enum.reduce(input, {0, 0, 0}, fn full_command, {horizontal, depth, aim} ->
      [command, number] = String.split(full_command, " ")
      value = number |> String.to_integer()

      case command do
        "down" -> {horizontal, depth, aim + value}
        "up" -> {horizontal, depth, aim - value}
        "forward" -> {horizontal + value, depth + value * aim, aim}
      end
    end)
    |> Tuple.delete_at(2)
    |> Tuple.product()
  end
end
