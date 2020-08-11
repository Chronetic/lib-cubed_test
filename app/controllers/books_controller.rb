class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
	require 'openlibrary'

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
		client = Goodreads::Client.new(api_key: "rSkvvZY8Wx27zcj4AfHA", api_secret: "S5WOpmY8pVtaEu1IwNn51DBafjoEIbjuxZdE6sNM")
		book = client.book_by_isbn("9780765326355")
		@book = Book.new(book_params)

#		puts book.title
#		puts book.description
#		puts book.work.original_title
#		puts book.num_pages
#		puts book.authors.author.name
#		puts book.publisher

		@book.titlelong = book.title
		puts @book.titlelong
		@book.description = book.description
		@book.title = book.work.original_title
		@book.pages = book.num_pages
		@book.author = book.authors.author.name
		@book.publisher = book.publisher

		#book.search("9780545790352", 5)
		#puts book.books.first.get_title
		#@show = Show.new(show_params)
		#@show.title = result["original_name"]
		#@show.description = result["overview"]
		#@show.seasons = result["number_of_seasons"]
		#@show.episodes = result["number_of_episodes"]
		#@show.episoderuntime = result["episode_run_time"].dig(0)
		#@show.showrating = result["vote_average"]
		#@show.airdate = result["first_air_date"]


    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :author, :user_id)
    end
end
