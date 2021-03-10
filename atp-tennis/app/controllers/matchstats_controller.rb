class MatchstatsController < ApplicationController
  before_action :set_matchstat, only: [:show, :edit, :update, :destroy]

  # GET /matchstats
  # GET /matchstats.json
  def index
    @matchstats = Matchstat.all
  end

  # GET /matchstats/1
  # GET /matchstats/1.json
  def show
    id = params[:id]
    
    @matchesAll = Match.all
    @matchStat = Matchstat.all
    matchRecord = Matchstat.find(id)
    matchId = matchRecord.matchId
    @selectedmatch = Match.where(matchId: matchId)
    
    @selectedmatch.each do |m|
      puts m.tournament
    end

    @player1Stat = Matchstat.where(matchId: matchId, winner: TRUE)
    @player2Stat = Matchstat.where(matchId: matchId, winner: FALSE)
    
    @playerid = []
    @points = []
      @winner = []
      @sets = []
      @set1 = []
      @set2 = []
      @set3 = []
      @set4 = []
      @set5 = []
      @avgodds = []
      @maxodds = []
      @totalpts = []
      @servept = []
      @rtnpt = []
      @aces = []
      @bpsaved = []
      @bpfaced = []
      @fsrw = []
      @ssrw = []
      @fsin = []
      @df = []
      @fsp = []

    @player1Stat.each do |p1|
      @playerid << p1.player.name
      @points << p1.points
      @winner << p1.winner
      @sets << p1.sets
      @set1 << p1.set1
      @set2 << p1.set2
      @set3 << p1.set3
      @set4 << p1.set4
      @set5 << p1.set5
      @avgodds << p1.avg_odds
      @maxodds << p1.max_odds
      @totalpts << p1.total_pts
      @servept << p1.serve_pt
      @rtnpt << p1.return_pt
      @aces << p1.aces
      @bpsaved << p1.bp_saved
      @bpfaced << p1.bp_faced
      @fsrw << p1.first_serve_rtn_won
      @ssrw << p1.second_serve_rtn_won
      @fsin << p1.first_serve_in
      @df << p1.dbl_faults
      @fsp << p1.first_server_per
    end   
    
    @player2Stat.each do |p2|
      @playerid << p2.player.name
      @points << p2.points
      @winner << p2.winner
      @sets << p2.sets
      @set1 << p2.set2
      @set2 << p2.set2
      @set3 << p2.set3
      @set4 << p2.set4
      @set5 << p2.set5
      @avgodds << p2.avg_odds
      @maxodds << p2.max_odds
      @totalpts << p2.total_pts
      @servept << p2.serve_pt
      @rtnpt << p2.return_pt
      @aces << p2.aces
      @bpsaved << p2.bp_saved
      @bpfaced << p2.bp_faced
      @fsrw << p2.first_serve_rtn_won
      @ssrw << p2.second_serve_rtn_won
      @fsin << p2.first_serve_in
      @df << p2.dbl_faults
      @fsp << p2.first_server_per
    end  

  end

  # GET /matchstats/new
  def new
    @matchstat = Matchstat.new
  end

  # GET /matchstats/1/edit
  def edit
  end

  # POST /matchstats
  # POST /matchstats.json
  def create
    @matchstat = Matchstat.new(matchstat_params)

    respond_to do |format|
      if @matchstat.save
        format.html { redirect_to @matchstat, notice: 'Matchstat was successfully created.' }
        format.json { render :show, status: :created, location: @matchstat }
      else
        format.html { render :new }
        format.json { render json: @matchstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matchstats/1
  # PATCH/PUT /matchstats/1.json
  def update
    respond_to do |format|
      if @matchstat.update(matchstat_params)
        format.html { redirect_to @matchstat, notice: 'Matchstat was successfully updated.' }
        format.json { render :show, status: :ok, location: @matchstat }
      else
        format.html { render :edit }
        format.json { render json: @matchstat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matchstats/1
  # DELETE /matchstats/1.json
  def destroy
    @matchstat.destroy
    respond_to do |format|
      format.html { redirect_to matchstats_url, notice: 'Matchstat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matchstat
      @matchstat = Matchstat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matchstat_params
      params.require(:matchstat).permit(:statId, :matchId, :playerId, :points, :rank, :winner, :sets, :set1, :set2, :set3, :set4, :set5, :avg_odds, :max_odds, :total_pts, :serve_pt, :return_pt, :aces, :bp_saved, :bp_faced, :first_serve_rtn_won, :second_serve_rtn_won, :first_serve_in, :dbl_faults, :first_server_per, :player_id, :match_id)
    end
end