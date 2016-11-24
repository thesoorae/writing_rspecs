require 'tdd'

describe "#my_uniq" do
  let(:arr1) { [1,2,1,3,3] }
  let(:arr2) { [5,4,3] }
  it "should remove duplicate elements" do
    expect(arr1.my_uniq).to eq([1,2,3])
  end

  context "when no duplicates" do
    it "should return unchanged array" do
      expect(arr2.my_uniq).to eq(arr2)
    end
  end

end

describe "#two_sum" do
  let(:arr) { [-1, 0, 2, -2, 1] }
  let(:arr2) { [-1, 1, 5, -2, 2] }

  it "should return pairs that sum up to zero" do
    expect(arr2.two_sum).to eq([[0, 1], [3, 4]])
  end

  it "should dictionary sort pairs" do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  let(:matrix_single){[1]}
  let(:matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ]
  }

  context "when matrix is 1x1" do
    it "should return unchanged matrix" do
      expect(matrix_single.my_transpose).to eq(matrix_single)
    end
  end

  it "should convert rows to columns" do
    expect(matrix.my_transpose).to eq(matrix.transpose)
  end

  it "should not use the Array class transpose method" do
    expect(matrix).to_not receive(:transpose)
    matrix.my_transpose
  end
end

describe "#stock_picker" do
  let(:easy_stocks) { [1, 3, 5, 2] }
  let(:tricky_stocks) { [5, 2, 1, 4] }

  it "should find most profitable pair" do
    expect(easy_stocks.stock_picker).to eq([0, 2])
  end

  it "should buy before selling" do
    expect(tricky_stocks.stock_picker).to eq([2, 3])
  end

  context "when arguments are less than 2" do
    it "should raise an error" do
    expect{ [2].stock_picker }.to raise_error("Array length should be greater than 1")
    end
  end
end

#test case for declining stocks
