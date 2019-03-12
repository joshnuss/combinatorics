defmodule Combinatorics do
  @moduledoc """
  Utility for generating combinatorics.
  Based on [implementation in CouchDB](https://github.com/apache/couchdb/blob/master/src/couch_tests/src/couch_tests_combinatorics.erl).
  """

  @doc """
  Generate a powerset for a given list.

  Returns a list.

  ## Examples

    iex> Combinatorics.powerset([:foo, :bar, :baz])
    [
        [:foo],
        [:foo,:baz],
        [:foo,:bar,:baz],
        [:foo,:bar],
        [:bar],
        [:bar,:baz],
        [:baz],
        []
    ]

  """
  @spec powerset(list()) :: list()
  def powerset([]), do: [[]]

  def powerset([h | t]) do
    pt = powerset(t)

    do_powerset(h, pt, pt)
  end

  @doc """
  Generate all permutations of a given list of lists.

  Returns a list of lists.

  ## Examples

    iex> Combinatorics.permutations([:foo, :bar, :baz])
    [
      [:foo, :bar, :baz],
      [:foo, :baz, :bar],
      [:bar, :foo, :baz],
      [:bar, :baz, :foo],
      [:baz, :foo, :bar],
      [:baz, :bar, :foo]
    ]

  """
  @spec permutations(list()) :: list()
  def permutations([]), do: [[]]

  def permutations(list) do
    for h <- list, t <- permutations(list -- [h]) do
      [h | t]
    end
  end

  @doc """
  Generate all product a given list.

  Returns a list.

  ## Examples

    iex> Combinatorics.product([ [:foo, :bar], [1, 2, 3] ])
    [
      [:foo, 1],
      [:foo, 2],
      [:foo, 3],
      [:bar, 1],
      [:bar, 2],
      [:bar, 3]
    ]

  """
  @spec product(list(list())) :: list(list())
  def product([]), do: []

  def product([h]) do
    for x <- h, do: [x]
  end

  def product([h | t]) do
    for a <- h, b <- product(t) do
      [a | b]
    end
  end

  defp do_powerset(_, [], acc), do: acc

  defp do_powerset(x, [h | t], acc) do
    do_powerset(x, t, [[x | h] | acc])
  end
end
