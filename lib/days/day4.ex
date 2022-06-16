defmodule AdventOfCode2021.Day4 do
  alias AdventOfCode2021.Utils.Board

  def solve(numbers, boards) do
    bingo_boards =
      boards
      |> Enum.map(&Board.new/1)

    {[winning_board], winning_number} =
      Enum.reduce_while(numbers, bingo_boards, fn number, boards ->
        marked_boards =
          boards
          |> Enum.map(&Board.mark_number(&1, number))

        winning_board =
          Enum.filter(marked_boards, fn board ->
            Board.get_winning_numbers(board) != []
          end)

        if winning_board == [], do: {:cont, marked_boards}, else: {:halt, {winning_board, number}}
      end)

    unmarked_sum = Board.get_other_numbers(winning_board) |> Enum.sum()
    last_number = String.to_integer(winning_number)

    unmarked_sum * last_number
  end

  def solve_part2(numbers, boards) do
    bingo_boards =
      boards
      |> Enum.map(&Board.new/1)

    {last_winning_board, last_winning_number} =
      Enum.reduce_while(numbers, bingo_boards, fn number, boards ->
        marked_boards =
          boards
          |> Enum.map(&Board.mark_number(&1, number))

        winning_board =
          Enum.filter(marked_boards, fn board ->
            Board.get_winning_numbers(board) != []
          end)

        boards_left = marked_boards -- winning_board

        if Kernel.length(boards_left) != 1 do
          {:cont, marked_boards}
        else
          [final_board] = boards_left

          {late_winning_board, late_winning_number} =
            numbers
            |> Enum.drop_while(&(&1 != number))
            |> Enum.reduce_while(final_board, fn number, board ->
              marked_board =
                board
                |> Board.mark_number(number)

              winning_numbers = Board.get_winning_numbers(marked_board)

              if winning_numbers == [],
                do: {:cont, marked_board},
                else: {:halt, {marked_board, number}}
            end)

          {:halt, {late_winning_board, late_winning_number}}
        end
      end)

    unmarked_sum =
      Board.get_other_numbers(last_winning_board)
      |> Enum.sum()

    last_number = String.to_integer(last_winning_number)

    unmarked_sum * last_number
  end
end
