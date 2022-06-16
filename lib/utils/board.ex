defmodule AdventOfCode2021.Utils.Board do
  alias __MODULE__

  def new(board) do
    Enum.map(board, fn row ->
      Enum.map(row, fn cell ->
        {cell, false}
      end)
    end)
  end

  def mark_number(board, number) do
    Enum.map(board, fn row ->
      Enum.map(row, fn {cell, marked} ->
        if marked == false, do: {cell, cell == number}, else: {cell, marked}
      end)
    end)
  end

  def get_winning_numbers(board) do
    row = Board.get_winning_row(board)
    col = Board.get_winning_column(board)

    [row, col] |> List.flatten() |> Enum.map(fn {number, true} -> String.to_integer(number) end)
  end

  def get_other_numbers(board) do
    Enum.reduce(board, [], fn row, acc ->
      acc ++
        Enum.reduce(row, [], fn {number, marked}, acc ->
          value = if marked == false, do: number, else: nil
          [value] ++ acc
        end)
    end)
    |> Enum.filter(& &1)
    |> Enum.map(&String.to_integer/1)
  end

  def get_winning_row(board) do
    Enum.filter(board, fn row ->
      Enum.all?(row, fn {_cell, marked} -> marked == true end)
    end)
    |> List.flatten()
  end

  def get_winning_column(board) do
    Enum.zip_with(board, & &1)
    |> Board.get_winning_row()
  end
end
