require "spec_helper"

describe Trackings do
  context "should loading trackers.yml" do
    before do
      Trackings.load!(File.expand_path "spec/fixtures/trackers.yml")
    end

    it { expect(Trackings.signup[:first_data]).not_to be_nil }
    it { expect(Trackings.signup[:first_data]).to eq "Dados básicos (E-mail e Senha)" }
  end
end
