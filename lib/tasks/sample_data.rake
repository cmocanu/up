namespace :db do 
	desc "Fill database with sample data"
	require 'faker'
	task populate: :environment do
		Rake::Task['db:reset'].invoke
		make_users
		make_posts
		make_comments
	end
end

def make_users
	30.times do |n|
		name = Faker::Name.name
		email = "example#{n}@gmail.com"
		User.create(name: name, email: email)
	end
end

def make_posts
	20.times do |n|
		title = Faker::Lorem.sentence(1)
		link = "http://www.google.com"
		Post.create(title: title, link: link, user_id: n + 1, karma: 0)
	end
end

def make_comments
	20.times do |n|
		content = Faker::Lorem.sentence(3)
		Comment.create(content: content, user_id: n + 1, post_id: 1, karma: Random.rand(50))
	end
end