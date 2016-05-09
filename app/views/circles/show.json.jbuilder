json.array! @circle.users.each do |user| 
json.email user.email
json.book user.books.first
end