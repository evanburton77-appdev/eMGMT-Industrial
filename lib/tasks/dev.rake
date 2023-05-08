task sample_data: :environment do
  starting = Time.now

  p "Creating sample data"

  if Rails.env.development?
    User.destroy_all
    Agent.destroy_all
  end

  athletes = Array.new { Faker::Sports::Basketball.player }



  12.times do 
   name = Faker::Music::Hiphop.artist
    u = User.create(
      email: "#{name}@example.com",
      first_name: name,
      password: "password",
      timezone: ["EST", "CST", "MST", "PST"].sample,
      photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuMT6kuEjCVGQmABoZtE-s1X_Eo5EcAH277BxLriNjnQ&s",
    )
  end

    12.times do 
   name = Faker::Book.author
    u = User.create(
      email: "#{name}@example.com",
      first_name: name,
      password: "password",
      timezone: ["EST", "CST", "MST", "PST"].sample,
      photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuMT6kuEjCVGQmABoZtE-s1X_Eo5EcAH277BxLriNjnQ&s",
    )
  end
  p "#{User.count} users have been created."

  # users = User.all

  # users.each do |first_user|
  #   users.each do |second_user|
  #     if rand < 0.75
  #       first_user.sent_follow_requests.create(
  #         recipient: second_user,
  #         status: FollowRequest.statuses.keys.sample,
  #       )
  #     end

  #     if rand < 0.75
  #       second_user.sent_follow_requests.create(
  #         recipient: first_user,
  #         status: FollowRequest.statuses.keys.sample,
  #       )
  #     end
  #   end
  # end

  # users.each do |user|
  #   rand(15).times do
  #     photo = user.own_photos.create(
  #       caption: Faker::Quote.most_interesting_man_in_the_world,
  #       owner: user,
  #       image: "https://robohash.org/#{rand(9999)}",
  #     )

  #     user.followers.each do |follower|
  #       if rand < 0.5
  #         photo.fans << follower
  #       end

  #       if rand < 0.25
  #         photo.comments.create(
  #           body: Faker::Quote.most_interesting_man_in_the_world,
  #           author: follower,
  #         )
  #       end
  #     end
  #   end
  # end

  ending = Time.now

  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  # p "There are now #{FollowRequest.count} follow requests."
  # p "There are now #{Photo.count} photos."
  # p "There are now #{Like.count} likes."
  # p "There are now #{Comment.count} comments."
end
