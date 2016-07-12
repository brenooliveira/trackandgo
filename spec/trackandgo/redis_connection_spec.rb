require 'spec_helper'

describe Trackandgo::RedisConnection do
  let(:pool) { described_class.create }

  it { expect(pool.checkout.class).to eq Redis }
  it { expect(pool.checkout.client.timeout).to eq 5 }
  it { expect(pool.instance_eval{ @size }).to eq 5 }

  describe "set a custom redis size" do
    let(:pool_size) { described_class.create(pool_size: 3) }
    it { expect(pool_size.instance_eval{ @size }).to eq 3 }
  end

  describe "sets a custom redis timeout" do
    let(:timeout) { described_class.create(network_timeout: 8) }
    it { expect(timeout.instance_eval{ @timeout }).to eq 8 }
  end

end
