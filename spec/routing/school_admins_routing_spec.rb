require "rails_helper"

RSpec.describe SchoolAdminsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/schools/1/school_admins").to route_to("school_admins#index", school_id: "1")
    end

    it "routes to #new" do
      expect(get: "/schools/1/school_admins/new").to route_to("school_admins#new", school_id: "1")
    end

    it "routes to #show" do
      expect(get: "/schools/1/school_admins/1").to route_to("school_admins#show", school_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/schools/1/school_admins/1/edit").to route_to("school_admins#edit", school_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "/schools/1/school_admins").to route_to("school_admins#create", school_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/schools/1/school_admins/1").to route_to("school_admins#update", school_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/schools/1/school_admins/1").to route_to("school_admins#update", school_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/schools/1/school_admins/1").to route_to("school_admins#destroy", school_id: "1", id: "1")
    end
  end
end
