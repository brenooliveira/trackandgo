require 'spec_helper'

describe Hash do
  context ".dig" do
    let(:hash) { {a: {b: "c"}} }

    it { expect(hash.dig(:a, :b)).to eq "c" }
    it { expect(hash.dig(:a, :c)).to be_nil }
  end
end
