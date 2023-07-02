require "rails_helper"

RSpec.describe StudentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/schools/1/courses/1/batches/1/students").to route_to("students#index", school_id: "1", course_id: "1", batch_id: "1")
    end

    it "routes to #new" do
      expect(get: "/schools/1/courses/1/batches/1/students/new").to route_to("students#new", school_id: "1", course_id: "1", batch_id: "1")
    end

    it "routes to #show" do
      expect(get: "/schools/1/courses/1/batches/1/students/1").to route_to("students#show", school_id: "1", course_id: "1", batch_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/schools/1/courses/1/batches/1/students/1/edit").to route_to("students#edit", school_id: "1", course_id: "1", batch_id: "1", id: "1")
    end


    it "routes to #create" do
      expect(post: "/schools/1/courses/1/batches/1/students").to route_to("students#create", school_id: "1", course_id: "1", batch_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/schools/1/courses/1/batches/1/students/1").to route_to("students#update", school_id: "1", course_id: "1", batch_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/schools/1/courses/1/batches/1/students/1").to route_to("students#update", school_id: "1", course_id: "1", batch_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/schools/1/courses/1/batches/1/students/1").to route_to("students#destroy", school_id: "1", course_id: "1", batch_id: "1", id: "1")
    end
  end
end
