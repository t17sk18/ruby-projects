namespace :match do
  desc "Matches Data Generate"
  task seed_match: :environment do
    Matchstat.destroy_all
    Match.destroy_all
    CSV.foreach("lib/assets/match.csv", :headers => true) do |row|
      puts row.inspect
      Match.create!(
        matchId: row[0],
        round: row[1],
        date: row[2],
        avg_min_game: row[3],
        avg_seconds_point: row[4],
        avg_minutes_set: row[5],
        tournament: row[6],
        year: row[7],
        match_minutes: row[8]
      )
    end
  end
end
