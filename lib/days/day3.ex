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
end
