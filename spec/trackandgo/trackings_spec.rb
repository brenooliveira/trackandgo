require "spec_helper"

describe Trackings do
  context "shold loading trackers.yml" do
    before do
      Trackings.load!(File.expand_path "spec/fixtures/trackers.yml")
    end

    it { binding.pry ; expect(Trackings.signup[:first_data]).not_to be_nil }
  end
end
