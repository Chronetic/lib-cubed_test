class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
	Tmdb::Api.key("87629cf821826e9275d3da823078cec7")
  # GET /movies
  # GET /movies.json
  def index
		if (params[:data] != nil)
			@movie = Movie.new
			@search = Tmdb::Search.new
			@search.resource('movie') # determines type of resource
			@search.query(params[:data]) # the query to search against
			@results = @search.fetch # makes request
			#https://image.tmdb.org/t/p/w300_and_h450_bestv2
		end

    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
		@movie = Movie.new
	end

  # GET /movies/1/edit
  def edit
  end

	def create_movie
		respond_to do |format|
			format.js {render layout: false}
		end
	end

  # POST /movies
  # POST /movies.json
  def create
		result = Tmdb::Movie.detail(movie_params[:imdb])
	  #puts result
		#test = result["original_title"]
		#puts test
		#params[:title] = test
		#puts params
		#puts details
		#movie_params[:title] = Tmdb::Find.imdb_id(movie_params[:imdb])[1]
    @movie = Movie.new(movie_params)
		@movie.title = result["original_title"]
		@movie.description = result["overview"]
		@movie.tagline = result["tagline"]
		@movie.runtime = result["runtime"]
		@movie.movierating = result["vote_average"]
		@movie.release_date = result["release_date"]

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
		respond_to do |format|
			result = Tmdb::Movie.detail(movie_params[:imdb])
			@movie.title = result["original_title"]
			@movie.description = result["overview"]
			@movie.tagline = result["tagline"]
			@movie.runtime = result["runtime"]
			@movie.movierating = result["vote_average"]
			@movie.release_date = result["release_date"]
			@movie.save
	    format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
	    format.json { render :show, status: :ok, location: @movie }
		end
	end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :runtime, :movierating, :tagline, :release_date, :user_id, :imdb)
    end
end
