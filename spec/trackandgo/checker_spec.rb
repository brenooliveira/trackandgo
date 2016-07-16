require "spec_helper"

describe Trackandgo::Checker do

  describe ".check" do
    context "when key does not exists key in config file" do
      it { expect(subject.check('any.invalid.key')).to be_falsey }
      it { expect(subject.check(nil)).to be_falsey }
      it { expect(subject.check("")).to be_falsey }
    end
  end

  describe ".uncheck" do
    context "when key does not exists key in config file" do
      it { expect(subject.uncheck('any.invalid.key')).to be_falsey }
      it { expect(subject.uncheck(nil)).to be_falsey }
      it { expect(subject.uncheck("")).to be_falsey }
    end
  end
end
