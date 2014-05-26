require "spec_helper"

describe Admin::PlacesController do
  describe "GET index" do
    it "denies non-admin access" do
      get :faq
      expect(response).to be_redirect
    end

    it "works for admins" do
      user = FactoryGirl.create(:user, admin: true)

      sign_in user

      get :faq
      expect(response).to render_template(:faq)
    end
  end
end
