defmodule CombinatoricsTest do
  use ExUnit.Case
  doctest Combinatorics

  import Combinatorics

  test "powerset" do
    assert powerset([]) == [[]]

    assert powerset([:foo, :bar, :baz]) == [
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

  test "permutations" do
    assert permutations([]) == [[]]

    assert permutations([:foo, :bar, :baz]) == [
             [:foo, :bar, :baz],
             [:foo, :baz, :bar],
             [:bar, :foo, :baz],
             [:bar, :baz, :foo],
             [:baz, :foo, :bar],
             [:baz, :bar, :foo]
           ]
  end
end
