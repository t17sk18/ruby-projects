require 'csv'
namespace :isocode do
  desc "ISOCodes Generate"
  task seed_isocode: :environment do
    #Player.destroy_all
    Isocode.destroy_all
    CSV.foreach("lib/assets/isocode.csv", :headers => true) do |row|
      puts row.inspect
      Isocode.create!(
        isocode: row[0],
        country: row[1]
      )
    end
  end
end
  
   

    


