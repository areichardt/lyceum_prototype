json.array! @circles.each do |circle| 
json.id circle.id
json.name circle.name
json.lesson_plan circle.lesson_plan 
json.users circle.comments.each {|comment| comment.user.email}
end