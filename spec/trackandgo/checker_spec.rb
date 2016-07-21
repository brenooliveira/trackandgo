require "spec_helper"

describe Trackandgo::Checker do

  before do
    Trackings.load!(File.expand_path "spec/fixtures/trackers.yml")
  end

  describe ".check" do
    context "when key is invalid" do
      it { expect{subject.check(nil, { route: 'any' })}.to raise_error ArgumentError }
    end

    context "when key does not exists route in config file" do
      it { expect(subject.check('marge', { route: 'any.invalid.key' })).to be_falsey }
      it { expect(subject.check('homer', { route: nil})).to be_falsey }
      it { expect(subject.check("bart", { route:"" })).to be_falsey }
    end

    context "should check route" do
      it { expect(subject.check("bart4", { route: "signup.first_data" })).to be_truthy }
    end
  end

  describe ".uncheck" do
    context "when key does not exists route in config file" do
      it { expect(subject.uncheck('lisa', { route: 'any.invalid.key' })).to be_falsey }
      it { expect(subject.uncheck('meggie', { route: nil })).to be_falsey }
      it { expect(subject.uncheck('mr.burns', { route: "" })).to be_falsey }
    end
  end
end
