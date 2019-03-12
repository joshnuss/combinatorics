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

  test "product" do
    assert product([]) == []
    assert product([[:foo, :bar]]) == [[:foo], [:bar]]

    assert product([[:foo, :bar], [1, 2, 3]]) == [
             [:foo, 1],
             [:foo, 2],
             [:foo, 3],
             [:bar, 1],
             [:bar, 2],
             [:bar, 3]
           ]
  end

  test "binary_combinations" do
    assert binary_combinations(3) == [
             [false, false, false],
             [false, false, true],
             [false, true, false],
             [false, true, true],
             [true, false, false],
             [true, false, true],
             [true, true, false],
             [true, true, true]
           ]
  end

  test "n_combinations" do
    assert n_combinations(0, [1, 2]) == [[]]
    assert n_combinations(10, []) == []

    assert n_combinations(2, [:mon, :tue, :wed, :thu, :fri]) == [
             [:mon, :tue],
             [:mon, :wed],
             [:mon, :thu],
             [:mon, :fri],
             [:tue, :wed],
             [:tue, :thu],
             [:tue, :fri],
             [:wed, :thu],
             [:wed, :fri],
             [:thu, :fri]
           ]
  end
end
