namespace :user do
  desc "TODO"
  task seed_user: :environment do
    Cart.destroy_all
    User.destroy_all
    CSV.foreach("lib/assets/user.csv", :headers => true) do |row|
      puts row.inspect
      User.create!(
        email: row[0],
        password: row[1],
        firstName: row[2],
        lastName: row[3],
        contact: row[4],
        address: row[5] 
      )
    end
  end
end