require "rails_helper"

RSpec.describe PhotosController, type: :routing do
  describe "ルーティング" do

    it "#index に振り分ける" do
      expect(get: "/photos").to route_to("photos#index")
    end

    it "#new に振り分ける" do
      expect(get: "/photos/new").to route_to("photos#new")
    end

    it "#show に振り分ける" do
      expect(get: "/photos/1").to route_to("photos#show", id: "1")
    end

    it "#edit に振り分ける" do
      expect(get: "/photos/1/edit").to route_to("photos#edit", id: "1")
    end

    it "#create に振り分ける" do
      expect(post: "/photos").to route_to("photos#create")
    end

    it "PUT で #update に振り分ける" do
      expect(put: "/photos/1").to route_to("photos#update", id: "1")
    end

    it "PATCH で #update に振り分ける" do
      expect(patch: "/photos/1").to route_to("photos#update", id: "1")
    end

    it "#destroy に振り分ける" do
      expect(delete: "/photos/1").to route_to("photos#destroy", id: "1")
    end

  end
end
