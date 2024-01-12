class ShowtimesController < ApplicationController
  load_and_authorize_resource
  before_action :load_theaters_and_movies, only: %i(new edit create update)

  # GET /showtimes or /showtimes.json
  def index
    @showtimes = Showtime.all
  end

  # GET /showtimes/1 or /showtimes/1.json
  def show; end

  # GET /showtimes/new
  def new
    @showtime = Showtime.new
  end

  # GET /showtimes/1/edit
  def edit; end

  # POST /showtimes or /showtimes.json
  def create
    @showtime = Showtime.new(showtime_params)

    respond_to do |format|
      if @showtime.save
        format.html { redirect_to showtime_url(@showtime), notice: "Showtime was successfully created." }
        format.json { render :show, status: :created, location: @showtime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /showtimes/1 or /showtimes/1.json
  def update
    respond_to do |format|
      if @showtime.update(showtime_params)
        format.html { redirect_to showtime_url(@showtime), notice: "Showtime was successfully updated." }
        format.json { render :show, status: :ok, location: @showtime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @showtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showtimes/1 or /showtimes/1.json
  def destroy
    @showtime.destroy!

    respond_to do |format|
      format.html { redirect_to showtimes_url, notice: "Showtime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def showtime_params
    params.require(:showtime).permit(:timing, :movie_id, :theater_id, :from_date, :to_date)
  end

  def load_theaters_and_movies
    @theaters = Theater.all
    @movies = Movie.all
  end
end
