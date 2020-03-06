# frozen_string_literal: true

require 'rails_helper'

describe Image do
  context 'validations' do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:description) }

    context 'when Image' do
      let(:image) { build(:image, :with_image) }

      describe 'has a file attached on it' do
        it 'is valid' do
          expect(image.file.attached?).to be true
          expect(image.valid?).to be true
        end
      end

      describe "hasn't a file attached on it" do
        before { image.file.purge }

        it 'is invalid' do
          expect(image.file.attached?).to be false
          expect(image.valid?).to be false
        end
      end
    end
  end

  describe 'image delegations to active storage blob' do
    before { image.file.analyze }

    describe '#content_type' do
      let(:image) { create(:image, :with_image) }
      it 'returns the blob content_type value' do
        expect(image.content_type).to eq 'image/jpeg'
      end
    end

    describe '#width' do
      let(:image) { create(:image, :with_image) }
      it 'returns the metadatum width value' do
        expect(image.width).to eq 700
      end
    end

    describe '#height' do
      let(:image) { create(:image, :with_image) }
      it 'returns the metadatum height value' do
        expect(image.height).to eq 400
      end
    end
  end
end
