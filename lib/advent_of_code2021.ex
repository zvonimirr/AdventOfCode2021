defmodule AdventOfCode2021 do
  def day1 do
    input =
      File.read!("inputs/day1.txt")
      |> String.split("\n")
      |> List.delete_at(-1)
      |> Enum.map(fn number ->
        Integer.parse(number)
        |> Kernel.elem(0)
      end)

    AdventOfCode2021.Day1.solve(input)
  end

  def day1_part2 do
    input =
      File.read!("inputs/day1.txt")
      |> String.split("\n")
      |> List.delete_at(-1)
      |> Enum.map(fn number ->
        Integer.parse(number)
        |> Kernel.elem(0)
      end)

    AdventOfCode2021.Day1.solve_part2(input)
  end
end
