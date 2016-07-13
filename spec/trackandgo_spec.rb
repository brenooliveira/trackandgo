require "spec_helper"

describe Trackandgo do

  context ".redis" do
    context "missing block" do
      it { expect{Trackandgo.redis}.to raise_error ArgumentError }
    end
  end
end
