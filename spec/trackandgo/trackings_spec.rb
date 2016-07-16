require "spec_helper"

describe Trackings do
  before do
    Trackings.load!(File.expand_path "spec/fixtures/trackers.yml")
  end

  context "should loading trackers.yml" do
    it { expect(Trackings.signup[:first_data]).not_to be_nil }
    it { expect(Trackings.signup[:first_data]).to eq "Dados básicos (E-mail e Senha)" }
  end

  context ".track?" do
    it { expect(Trackings).to be_track "signup.first_data" }
    it { expect(Trackings).not_to be_track "any.other.track" }
    it { expect(Trackings).not_to be_track nil }
    it { expect(Trackings).not_to be_track "" }
    it { expect(Trackings).not_to be_track "---" }
  end
end
