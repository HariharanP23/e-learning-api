json.term do
  json.partial! 'api/v1/terms/term', term: course.term
end
json.id course.id
json.title course.title
json.description course.description
json.department course.department
json.course_code course.course_code
json.status course.status
# json.assignment_count course.assignments.count
# json.announcement_count course.announcements.count
# json.favorited @current_user ? @current_user.favorites.include?(@course) : false