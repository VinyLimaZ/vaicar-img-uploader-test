# frozen_string_literal: true

describe 'Images' do
  describe '#show' do
    context 'when find an image' do
      let(:image) { build(:image, :with_image).tap(&:save) }
      it 'renders a page with it' do
        get image_path(image)

        expect(response).to have_http_status :success
        expect(response.body).to include image.owner
      end
    end

    context "when don't find an image" do
      let(:image) { build_stubbed(:image, slug: '123') }
      it 'redirects to new page' do
        get image_path(image)
        follow_redirect!

        expect(path).to eq new_image_path
      end
    end
  end

  describe '#create' do
    let(:image_file) { fixture_file_upload(Rails.root.join('spec/support/images/img_1.jpg')) }
    context 'when all params are valid' do
      let(:image_params) { attributes_for(:image).merge(file: image_file) }

      it 'creates a new image object with file attached' do
        expect do
          post images_path, params: { image: image_params }
        end.to change(ActiveStorage::Attachment, :count).by 1

        expect(response).to redirect_to image_path(Image.last)
        follow_redirect!
        expect(response.body).to include image_params[:owner]
      end
    end

    context 'when not all params are present' do
      let(:image_params) { attributes_for(:image, owner: nil, description: nil).merge(file: nil) }

      it 'returns an error saying which one is wrong/missing' do
        post images_path, params: { image: image_params }
        expect(response.body).to include 'You need to fill the owner field'
        expect(response.body).to include 'You need to fill the description field'
        expect(response.body).to include 'Image file wasn&#39;t present, choose one to upload'
      end
    end
  end

  describe '#index' do
    context 'when has an image on database' do
      let!(:image_one) { create(:image, :with_image) }
      let!(:image_two) { create(:image, :with_image) }

      it 'renders all images' do
        get images_path

        expect(response.body).to include image_one.owner
        expect(response.body).to include image_two.owner
      end
    end

    context 'when hasnt an image on database' do
      it 'redirects to new image path' do
        get images_path

        expect(response).to redirect_to new_image_path
        follow_redirect!
        expect(path).to eq new_image_path
      end
    end
  end
end
