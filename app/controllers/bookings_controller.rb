class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show edit update destroy)
  before_action :load_movie

  def index
    @bookings = current_user.bookings
  end

  def show; end

  def new
    @booking = Booking.new
    @seats = []

    if params[:showtime_id].present?
      @showtime = Showtime.find(params[:showtime_id])
      @booking.show_date = Date.today unless params[:show_date].present?
      @seats = @showtime.theater.seats.order(category: :desc, id: :asc).group_by(&:category)
      @booked_seats = @showtime.bookings.where(show_date: @booking.show_date).pluck(:seat_numbers).flatten
    end
  end

  def edit
    @seats = @booking.showtime.theater.seats.group_by(&:category)
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to movie_booking_path(@movie, @booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to movie_booking_path(@movie, @booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to movie_bookings_url(@movie), notice: "Booking was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  def seat_options
    @showtime = Showtime.find(params[:showtime_id])
    @seats = @showtime.theater.seats.order(category: :desc, id: :asc).group_by(&:category)
    @booked_seats = @showtime.bookings.where(show_date: params[:show_date]).pluck(:seat_numbers).flatten
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :showtime_id, :show_date, seat_numbers: [])
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end
