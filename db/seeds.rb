50.times do |n|
  Post.create!(
    title: "Ferrari of your dreams in great condition and freshly waxed.  Only $#{n},000.",
    content: "This content is for title #{n}.  It is being written 20 times.  "*20,
    phone: 1112223333,
    email: "email#{n}@hlist.com",
    user_id: 1
  )

  Post.create!(
    title: "Website creation service: only $#{100-n}00!",
    content: "This content is for title #{100-n}.  It is being written 40 times.  "*40,
    phone: 1112223333,
    email: "email#{n}@hlist.com",
    user_id: 2
  )
end