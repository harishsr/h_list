100.times do |n|
  Post.create!(
    title: "This is title #{n}",
    content: "This content is for title #{n}.  It is being written 20 times"*20,
    phone: 1112223333,
    email: "email#{n}@h_list.com",
    # user_id: n
  )
end