defmodule AdventOfCode2021 do
  def day1 do
    input =
      File.read!("inputs/day1.txt")
      |> String.split("\n")
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn x ->
        {res, ""} = Integer.parse(x)
        res
      end)

    AdventOfCode2021.Day1.solve(input)
  end
end
