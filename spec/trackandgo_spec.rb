require "spec_helper"

describe Trackandgo do

  context ".redis" do
    context "missing block" do
      it { expect{Trackandgo.redis}.to raise_error ArgumentError }
      it do
        count = []
        expect {
          Trackandgo.redis do
            raise Redis::CommandError
          end
        }.to raise_error Redis::CommandError

      end
    end
  end
end
