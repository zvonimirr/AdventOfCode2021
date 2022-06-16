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
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    AdventOfCode2021.Day1.solve_part2(input)
  end

  def day2 do
    input =
      File.read!("inputs/day2.txt")
      |> String.split("\n", trim: true)

    AdventOfCode2021.Day2.solve(input)
  end

  def day2_part2 do
    input =
      File.read!("inputs/day2.txt")
      |> String.split("\n", trim: true)

    AdventOfCode2021.Day2.solve_part2(input)
  end

  def day3 do
    input =
      File.read!("inputs/day3.txt")
      |> String.split("\n", trim: true)

    AdventOfCode2021.Day3.solve(input)
  end

  def day3_part2 do
    input =
      File.read!("inputs/day3.txt")
      |> String.split("\n", trim: true)

    AdventOfCode2021.Day3.solve_part2(input)
  end

  def day4 do
    [number_data | board_data] =
      File.read!("inputs/day4.txt")
      |> String.split("\n", trim: true)

    numbers =
      number_data
      |> String.split(",", trim: true)

    boards =
      board_data
      |> Enum.chunk_every(5)
      |> Enum.map(fn board ->
        board
        |> Enum.map(&String.split/1)
      end)

    AdventOfCode2021.Day4.solve(numbers, boards)
  end

  def day4_part2 do
    [number_data | board_data] =
      File.read!("inputs/day4.txt")
      |> String.split("\n", trim: true)

    numbers =
      number_data
      |> String.split(",", trim: true)

    boards =
      board_data
      |> Enum.chunk_every(5)
      |> Enum.map(fn board ->
        board
        |> Enum.map(&String.split/1)
      end)

    AdventOfCode2021.Day4.solve_part2(numbers, boards)
  end
end
