class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy, :search]
	Tmdb::Api.key("87629cf821826e9275d3da823078cec7")

  # GET /shows
  # GET /shows.json
  def index
		if (params[:data] != nil)
			@show = Show.new
			@search = Tmdb::Search.new
			@search.resource('tv') # determines type of resource
			@search.query(params[:data]) # the query to search against
			@results = @search.fetch # makes request
			#https://image.tmdb.org/t/p/w300_and_h450_bestv2
		end

    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
		result = Tmdb::TV.detail(show_params[:tmdbid])
		@show = Show.new(show_params)
		@show.title = result["name"]
		@show.description = result["overview"]
		@show.seasons = result["number_of_seasons"]
		@show.episodes = result["number_of_episodes"]
		@show.episoderuntime = result["episode_run_time"].dig(0)
		@show.showrating = result["vote_average"]
		@show.airdate = result["first_air_date"]


    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
	def update
		respond_to do |format|
			result = Tmdb::TV.detail(show_params[:tmdbid])
			@show.title = result["name"]
			@show.description = result["overview"]
			@show.seasons = result["number_of_seasons"]
			@show.episodes = result["number_of_episodes"]
			@show.episoderuntime = result["episode_run_time"].dig(0)
			@show.showrating = result["vote_average"]
			@show.airdate = result["first_air_date"]
			@show.save
	    format.html { redirect_to @show, notice: 'Show was successfully updated.' }
	    format.json { render :show, status: :ok, location: @show }
		end
	end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:title, :description, :seasons, :episodes, :tmdbid, :showrating, :episoderuntime, :airdate, :user_id)
    end
end
