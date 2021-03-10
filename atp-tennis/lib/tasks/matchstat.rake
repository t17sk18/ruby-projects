namespace :matchstat do
  desc "Match Statistics"
  task seed_matchstat: :environment do
  Matchstat.destroy_all
  CSV.foreach("lib/assets/matchstat.csv", :headers => true) do |row|
    #puts row.inspect
      player = Player.all
      match = Match.all
      match.each do |match|  
        #puts match.inspect
        player.each do |player|
        #puts player.inspect
        
        if player.playerId == row[2] && match.matchId == row[1]
          Matchstat.create!(
          statId: row[0],
          matchId: row[1],
          playerId: row[2],
          points: row[3],
          rank: row[4],
          winner: row[5],
          sets: row[6],
          set1: row[7],
          set2: row[8],
          set3: row[9],
          set4: row[10],
          set5: row[11],
          avg_odds: row[12],
          max_odds: row[13],
          total_pts: row[14],
          serve_pt: row[15],
          return_pt: row[16],
          aces: row[17],
          bp_saved: row[18],
          bp_faced: row[19],
          first_serve_rtn_won: row[20],
          second_serve_rtn_won: row[21],
          first_serve_in: row[22],
          dbl_faults: row[23],
          first_server_per: row[24],
          player_id: player.id,
          match_id: match.id
          )
        else
          next
        end
      end
    end
  end
  end    
end
 