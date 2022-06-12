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

  def day2 do
    input =
      File.read!("inputs/day2.txt")
      |> String.split("\n")
      |> List.delete_at(-1)

    AdventOfCode2021.Day2.solve(input)
  end

  def day2_part2 do
    input =
      File.read!("inputs/day2.txt")
      |> String.split("\n")
      |> List.delete_at(-1)

    AdventOfCode2021.Day2.solve_part2(input)
  end

  def day3 do
    input =
      File.read!("inputs/day3.txt")
      |> String.split("\n")
      |> List.delete_at(-1)

    AdventOfCode2021.Day3.solve(input)
  end

  def day3_part2 do
    input =
      File.read!("inputs/day3.txt")
      |> String.split("\n")
      |> List.delete_at(-1)

    AdventOfCode2021.Day3.solve_part2(input)
  end
end
