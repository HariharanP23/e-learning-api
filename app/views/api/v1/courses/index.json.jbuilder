json.partial! 'api/v1/shared/pagination', pagination: @pagination if @pagination

json.data do
  json.array! @courses do |course|
    json.partial! 'api/v1/courses/course', course: course
  end
end