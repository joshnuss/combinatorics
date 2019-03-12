defmodule CombinatoricsTest do
  use ExUnit.Case
  doctest Combinatorics

  test "powerset" do
    assert Combinatorics.powerset([]) == [[]]

    assert Combinatorics.powerset([:foo, :bar, :baz]) == [
             [:foo],
             [:foo, :baz],
             [:foo, :bar, :baz],
             [:foo, :bar],
             [:bar],
             [:bar, :baz],
             [:baz],
             []
           ]
  end
end
