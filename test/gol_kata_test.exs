defmodule GolKataTest do
  use ExUnit.Case
  doctest GolKata

  test "getting dead neighbors" do
    board = for i <- 1..3, j <- 1..3 do
      {i, j}
    end
    |> Map.new(fn coord -> {coord, :dead} end)

    neighbors = GolKata.get_neighbors(board, {2,2})
    assert Enum.count(neighbors) == 8
    assert Enum.all?(fn {_k, v} -> v == :dead end)
  end

  test "isolated noob" do
    # neighbors = 
    assert GolKata.hello() == :world
  end
end
