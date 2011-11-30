# Seed the user for testing via browser

User.destroy_all
Post.destroy_all
Kurakani::Comment.destroy_all

puts "Creating user millisami ..."
User.create!(:username => "millisami", :email => "millisami@gmail.com", :password => "secret")

puts "Creating user admin ..."
User.create!(:username => "admin", :email => "admin@gmail.com", :password => "secret", :admin => true)

puts "Creating sample posts ..."
10.times do |n|
  Post.create!(:title => "Sample post title #{n}", :content => "#{n} - Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
end

@post = Post.first
@users = User.all
puts "Creating n associating comments ..."
5.times do |n|
  Kurakani::Comment.create!(:content => "#{n} comment for the commentable.", :user => @users.shuffle.first, 
                            :commentable_type => "Post", :commentable_id => @post.id)
end

