# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Initialize first account:
admin = User.create! do |u|
    u.name      = 'Admin'
    u.email     = 'admin@admin.com'
    u.password    = 'admin123'
end

school1 = School.create! do |s|
    s.name = "School 1"
    s.description = "School 1 Description"
end

school2 = School.create! do |s|
    s.name = "School 2"
    s.description = "School 2 Description"
end


school_admin = school1.school_admins.create! do |sa|
    sa.name      = 'School Admin'
    sa.email     = 'school_admin@admin.com'
    sa.password    = 'school_admin123'
end

course1 = school1.courses.create! do |c|
    c.name = "Maths"
    c.description = "Maths"
end

course2 = school1.courses.create! do |c|
    c.name = "Science"
    c.description = "Science"
end

course3 = school1.courses.create! do |c|
    c.name = "Computer"
    c.description = "Computer"
end

batch1 = course1.batches.create! do |b|
    b.name = "Maths Batch 1"
    b.description = "Maths Batch 1"
    b.school_id = course1.school.id
end

batch2 = course1.batches.create! do |b|
    b.name = "Maths Batch 2"
    b.description = "Maths Batch 2"
    b.school_id = course1.school.id
end

student1 = batch1.students.create! do |s|
   s.name = "Student 1"
   s.email = "student1@test.com"
   s.password = "password"
   s.school_id = batch1.course.school.id
   s.course_id = batch1.course.id
   s.status = "approved"
end

student1 = batch1.students.create! do |s|
   s.name = "Student 2"
   s.email = "student2@test.com"
   s.password = "password"
   s.school_id = batch1.course.school.id
   s.course_id = batch1.course.id
   s.status = "approved"
end
