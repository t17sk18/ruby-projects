namespace :player do
  desc "TODO"
  task seed_player: :environment do
    Matchstat.destroy_all
    Player.destroy_all
    CSV.foreach("lib/assets/player.csv", :headers => true) do |row|
      puts row.inspect
      isocode = Isocode.all
      isocode.each do |iso|
        if iso.isocode == row[3]
          Player.create!(
          playerId: row[0],
          name: row[1],
          hand: row[2],
          country: row[3],
          birthday: row[4],
          isocode_id: iso.id
          )
        else
          next
        end
      end

    end
  end
end
