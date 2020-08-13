class ComicsController < ApplicationController
	include ActionView::Helpers::TextHelper
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.all
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
  end

  # GET /comics/new
  def new
    @comic = Comic.new
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
		client = Goodreads::Client.new(api_key: "rSkvvZY8Wx27zcj4AfHA", api_secret: "S5WOpmY8pVtaEu1IwNn51DBafjoEIbjuxZdE6sNM")
		comic = client.book_by_isbn(comic_params[:isbn])
		@comic = Comic.new(comic_params)

#		puts book.title
#		puts book.description
#		puts book.work.original_title
#		puts book.num_pages
#		puts book.authors.author.name
#		puts book.publisher

		@comic.description = strip_tags(comic.description)
		puts @comic.description#.gsub(/<br\s*\?>/, '')
		@comic.title = comic.title
		@comic.pages = comic.num_pages
		@comic.author = comic.authors.author[0].name
		@comic.comicrating = comic.average_rating
		puts @comic.comicrating

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
		respond_to do |format|
			client = Goodreads::Client.new(api_key: "rSkvvZY8Wx27zcj4AfHA", api_secret: "S5WOpmY8pVtaEu1IwNn51DBafjoEIbjuxZdE6sNM")
			comic = client.book_by_isbn(comic_params[:isbn])
			@comic.description = strip_tags(comic.description)
	 		@comic.title = comic.title
	 		@comic.pages = comic.num_pages
	 		@comic.author = comic.authors.author[0].name
	 		@comic.comicrating = comic.average_rating
			@comic.save
			format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
			format.json { render :show, status: :ok, location: @comic }
		end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comic_params
      params.require(:comic).permit(:title, :description, :author, :isbn, :pages, :user_id)
    end
end
