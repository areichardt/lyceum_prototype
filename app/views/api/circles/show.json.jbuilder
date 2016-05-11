json.array! @circle.comments.each do |comment| 
json.user comment.user.email
json.comment comment.body
end