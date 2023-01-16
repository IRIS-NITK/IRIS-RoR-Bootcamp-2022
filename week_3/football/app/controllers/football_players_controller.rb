class FootballPlayersController < ApplicationController
  before_action :set_football_player, only: %i[ show edit update destroy ]

  # GET /football_players or /football_players.json
  def index
    @football_players = FootballPlayer.all
  end

  # GET /football_players/1 or /football_players/1.json
  def show
  end

  # GET /football_players/new
  def new
    @football_player = FootballPlayer.new
  end

  # GET /football_players/1/edit
  def edit
  end

  # POST /football_players or /football_players.json
  def create
    @football_player = FootballPlayer.new(football_player_params)

    respond_to do |format|
      if @football_player.save
        format.html { redirect_to football_player_url(@football_player), notice: "Football player was successfully created." }
        format.json { render :show, status: :created, location: @football_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @football_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /football_players/1 or /football_players/1.json
  def update
    respond_to do |format|
      if @football_player.update(football_player_params)
        format.html { redirect_to football_player_url(@football_player), notice: "Football player was successfully updated." }
        format.json { render :show, status: :ok, location: @football_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @football_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /football_players/1 or /football_players/1.json
  def destroy
    @football_player.destroy

    respond_to do |format|
      format.html { redirect_to football_players_url, notice: "Football player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_football_player
      @football_player = FootballPlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def football_player_params
      params.require(:football_player).permit(:name, :rank, :country, :position, :squad, :league, :age, :born, :minutes_played, :goals, :penalty_kicks_made, :matches_played, :corner_kicks, :yellow_card, :red_card, :penalty_kicks_won, :fouls_committed)
    end
end
