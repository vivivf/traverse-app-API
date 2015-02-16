class PlacesController < ApplicationController
  def create
    @yelp_link = request.url
    @address = params[:location][:coordinate]
    @photo_url = params[:image_url]
    @name = params[:name]

    event = Event.find(params[:event_id])
    place = event.places.create(yelp_link: @yelp_link, address: @address, photo_url: @photo_url, name: @name)
    place.update(event_id: event.id)
    render json: place
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: place
  end

  def yelp
    p "#" * 20
    p params
    p "#" * 20
    locale = {lang: 'en'}
    parameters = { term: params[:term], limit: 10 }
    render json: Yelp.client.search(params[:location], parameters, locale)
  end

 private
  def places_params
    params.require(:place).permit(:yelp_link, :address, :name, :photo_url, :event_id)
  end
end

