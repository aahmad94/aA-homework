require 'rspec'
require 'spec_helper'
require 'a01'

describe "#merge_sort" do
  # write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  let(:array) { [1, 2, 3, 4, 5].shuffle }

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  it "sorts numbers" do
    expect(array.merge_sort).to eq(array.sort)
  end

  it "sorts arrays with duplicates" do
    expect([5, 4, 3, 3, 2, 1].merge_sort).to eq([1, 2, 3, 3, 4, 5])
  end

  it "will use block if given" do
    reversed = array.merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    duped_array = array.dup
    duped_array.merge_sort
    expect(duped_array).to eq(array)
  end

  it "calls the merge helper method" do
    expect(Array).to receive(:merge).at_least(:once).and_call_original
    array.merge_sort
  end
end

describe "#two_sum" do
  # Write a new `Array#two_sum` method that determines whether
  # an array has positions where the elements at those positions
  # sum to zero.

  it "finds a matching pair" do
    expect([5, 1, -7, -5].two_sum).to eq(true)
  end

  it "works with multiple pairs" do
    expect([5, -1, -5, 1].two_sum).to eq(true)
  end

  it "works with multiple pairs for the same element" do
    expect([5, -5, -5].two_sum).to eq(true)
  end

  it "returns false when no pair is found" do
    expect([5, 5, 3, 1].two_sum).to eq(false)
  end

  it "won't find spurious zero pairs" do
    expect([0, 1, 2, 3].two_sum).to eq(false)
  end

  it "will find real zero pairs" do
    expect([0, 1, 2, 0].two_sum).to eq(true)
  end
end

describe '#sum_rec' do
  # write a method called 'sum_rec' that
  # recursively calculates the sum of an array of values

  it "returns 0 if no values are given" do
    expect(sum_rec([])).to eq(0)
  end

  it "returns the first value if 1 value is given" do
    expect(sum_rec([1])).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:sum_rec).at_least(:twice).and_call_original
    sum_rec([1, 2, 3, 4])
  end

  it "sums multiple numbers" do
    expect(sum_rec([1, 2, 3, 4])).to eq(10)
  end

  it "sums multiple numbers II" do
    expect(sum_rec([-10, 10, 5, 4])).to eq(9)
  end
end

describe "#subword_counts" do
# Write a `String#subword_counts` method that takes a dictionary
# (array of possible words) and returns a hash where the keys are
# subwords, and the values are numbers of times each appears in the
# String.

let(:dictionary) do
# a small dictionary of words
  ["a", "am", "an", "pa", "pan", "panama"]
end

it "returns words nested inside another word" do
  subword_counts = "raman".subword_counts(dictionary)

  expect(subword_counts).to eq({
    "a" => 2,
    "am" => 1,
    "an" => 1
  })
end

it "returns words nested inside another word" do
  subword_counts = "panama".subword_counts(dictionary)

  expect(subword_counts).to eq({
    "a" => 3,
    "am" => 1,
    "an" => 1,
    "pa" => 1,
    "pan" => 1,
    "panama" => 1
    })
  end
end

describe "#nth_prime" do
  # `nth_prime(n)` returns the nth prime number
  it "returns the first prime number" do
    expect(nth_prime(1)).to eq(2)
  end

  it "returns the fifth prime number" do
    expect(nth_prime(5)).to eq(11)
  end

  it "returns nil when asked for the zeroth prime" do
    expect(nth_prime(0)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe 'Array#my_inject' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_inject(:dummy, &block)
    end.to yield_control.once
  end

  it 'makes the first element the accumulator if no default is given' do
    expect do |block|
      ["el1", "el2", "el3"].my_inject(&block)
    end.to yield_successive_args(["el1", "el2"], [nil, "el3"])
  end

  it 'yields the accumulator and each element to the block' do
    expect do |block|
      [1, 2, 3].my_inject(100, &block)
    end.to yield_successive_args([100, 1], [nil, 2], [nil, 3])
  end

  it 'does NOT call the built in Array#inject method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:inject)
    original_array.my_inject {}
  end

  it 'is chainable and returns a new array' do
    original_array = ["original array"]
    expect(original_array.my_inject {}).not_to eq(original_array)
  end
end

