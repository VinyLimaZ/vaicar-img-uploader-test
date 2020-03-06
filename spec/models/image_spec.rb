# frozen_string_literal: true

require 'rails_helper'

describe Image do
  context 'validations' do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:description) }

    context 'when Image' do
      let(:image) { build(:image) }

      describe 'has a file attached on it' do
        before { image.file.attach(io: File.open('spec/support/images/img_1.jpg'), filename: 'img.jpg') }

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
end
