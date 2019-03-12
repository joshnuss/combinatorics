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
  def powerset([]), do: [[]]

  def powerset([h | t]) do
    pt = powerset(t)

    do_powerset(h, pt, pt)
  end

  defp do_powerset(_, [], acc), do: acc

  defp do_powerset(x, [h | t], acc) do
    do_powerset(x, t, [[x | h] | acc])
  end
end
