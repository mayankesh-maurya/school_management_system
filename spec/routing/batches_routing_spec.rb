require "rails_helper"

RSpec.describe BatchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/schools/1/courses/1/batches").to route_to("batches#index", school_id: "1", course_id: "1")
    end

    it "routes to #new" do
      expect(get: "/schools/1/courses/1/batches/new").to route_to("batches#new", school_id: "1", course_id: "1")
    end

    it "routes to #show" do
      expect(get: "/schools/1/courses/1/batches/1").to route_to("batches#show", school_id: "1", course_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/schools/1/courses/1/batches/1/edit").to route_to("batches#edit", school_id: "1", course_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "/schools/1/courses/1/batches").to route_to("batches#create", school_id: "1", course_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/schools/1/courses/1/batches/1").to route_to("batches#update", school_id: "1", course_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/schools/1/courses/1/batches/1").to route_to("batches#update", school_id: "1", course_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/schools/1/courses/1/batches/1").to route_to("batches#destroy", school_id: "1", course_id: "1", id: "1")
    end
  end
end
