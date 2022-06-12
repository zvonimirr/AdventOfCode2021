defmodule AdventOfCode2021.Day1 do
  def solve(input) do
    input
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [a, b], acc ->
      if b > a do
        acc + 1
      else
        acc
      end
    end)
  end
end
