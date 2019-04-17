defmodule GolKata do
  @moduledoc """
  Documentation for GolKata.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GolKata.hello()
      :world

  """
  def hello do
    :world
  end

  def get_neighbors(board, {x0,y0}) do
    xs = x0-1..x0+1
    ys = y0-1..y0+1

    squares = for x <- xs, y <- ys, do: {x,y}

    squares
    |> Enum.filter(fn xy -> xy != {x0, y0} end)
    |> Enum.map(fn xy -> Map.get(board, xy, :dead) end)
  
  end

  def pprint(board) do
    {xmin, xmax} = 
      Enum.map(board, fn {{x, _y}, _v} -> x end)
      |> Enum.min_max()

    {ymin, ymax} =
      Enum.map(board, fn {{_x, y}, _v} -> y end)
      |> Enum.min_max()

    lines = 
      Enum.map(ymin..ymax, 
        fn y -> Enum.map(xmin..xmax, 
                  fn x -> case Map.get(board, {x,y}) do
                    :live -> '*'
                    _ -> '.'
                    end 
                  end) end)
      |> Enum.map(&List.to_string/1)
      |> Enum.each(&IO.puts/1)

  end

end
