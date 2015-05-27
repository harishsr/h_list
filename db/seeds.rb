50.times do |n|
  Post.create!(
    title: "This is title #{n} and it is a basic title",
    content: "This content is for title #{n}.  It is being written 20 times.  "*20,
    phone: 1112223333,
    email: "email#{n}@hlist.com",
    user_id: 1
  )

  Post.create!(
    title: "This is title #{n+50} and it is a basic title",
    content: "This content is for title #{n+50}.  It is being written 20 times.  "*20,
    phone: 1112223333,
    email: "email#{n}@hlist.com",
    user_id: 2
  )
end