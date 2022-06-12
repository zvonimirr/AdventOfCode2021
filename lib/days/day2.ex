defmodule AdventOfCode2021.Day2 do
  def solve(input) do
    parsed_input =
      input
      |> Enum.map(&String.split(&1, " "))
      |> Enum.map(fn [command, value] ->
        [
          command
        ] ++
          [
            Integer.parse(value)
            |> Kernel.elem(0)
          ]
      end)

    horizontal =
      parsed_input
      |> Enum.filter(fn [command, _value] -> command == "forward" end)
      |> Enum.map(&List.last/1)
      |> Enum.sum()

    depth =
      parsed_input
      |> Enum.filter(fn [command, _value] -> command == "up" or command == "down" end)
      |> Enum.map(fn [command, value] ->
        if command == "up", do: -value, else: value
      end)
      |> Enum.sum()

    horizontal * depth
  end
end
