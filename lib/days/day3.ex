defmodule AdventOfCode2021.Day3 do
  def solve(input) do
    len = input |> List.first() |> String.length()

    gamma_rate =
      for pos <- 1..len do
        %{"0" => zeros, "1" => ones} =
          Enum.map(input, &String.at(&1, pos - 1)) |> Enum.group_by(& &1)

        if Kernel.length(zeros) > Kernel.length(ones), do: 0, else: 1
      end
      |> Enum.join("")
      |> Integer.parse(2)
      |> Kernel.elem(0)

    epsilon_rate =
      for pos <- 1..len do
        %{"0" => zeros, "1" => ones} =
          Enum.map(input, &String.at(&1, pos - 1)) |> Enum.group_by(& &1)

        if Kernel.length(zeros) > Kernel.length(ones), do: 1, else: 0
      end
      |> Enum.join("")
      |> Integer.parse(2)
      |> Kernel.elem(0)

    gamma_rate * epsilon_rate
  end

  def solve_part2(input) do
    # Filtered list, index
    oxygen_generator_rating =
      input
      |> Enum.reduce_while({input, 0}, fn _list, {previous, index} ->
        %{"0" => zeros, "1" => ones} =
          previous |> Enum.map(&String.at(&1, index)) |> Enum.group_by(& &1)

        mcb = if Kernel.length(zeros) > Kernel.length(ones), do: "0", else: "1"

        filtered_list = previous |> Enum.filter(&(String.at(&1, index) == mcb))

        if Kernel.length(filtered_list) == 1,
          do: {:halt, filtered_list},
          else: {:cont, {filtered_list, index + 1}}
      end)
      |> List.first()
      |> Integer.parse(2)
      |> Kernel.elem(0)

    co2_scrubber_rating =
      input
      |> Enum.reduce_while({input, 0}, fn _list, {previous, index} ->
        %{"0" => zeros, "1" => ones} =
          previous |> Enum.map(&String.at(&1, index)) |> Enum.group_by(& &1)

        lcb = if Kernel.length(zeros) > Kernel.length(ones), do: "1", else: "0"

        filtered_list = previous |> Enum.filter(&(String.at(&1, index) == lcb))

        if Kernel.length(filtered_list) == 1,
          do: {:halt, filtered_list},
          else: {:cont, {filtered_list, index + 1}}
      end)
      |> List.first()
      |> Integer.parse(2)
      |> Kernel.elem(0)

    oxygen_generator_rating * co2_scrubber_rating
  end
end
