defmodule AdventOfCode2021.Day1 do
  def solve(input) do
    input
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> b > a end)
  end
end
