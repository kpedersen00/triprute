# Return an HTML form for creating a new destination
get '/trips/:id/destinations/new' do
  @trip = Trip.find(params[:id])
  "This is the new destinations page!"
  erb :'destinations/new'
end

post '/trips/:id/destinations' do
  p params
  @trip = Trip.find(params[:id])
  @destination = Destination.create(
                          city: params[:city],
                          country: params[:country],
                          highlights: params[:highlights],
                          lodging: params[:lodging],
                          transportation: params[:transportation],
                          days: params[:days],
                          trip_id: params[:id]
                          )
  redirect "/trips/#{@trip.id}/destinations/#{@destination.id}"
end

get '/trips/:id/destinations/:destination_id' do
  p params
  p @trip = Trip.find(params[:id])
  p @destination = Destination.find(params[:destination_id])
  erb :'trips/show'
end
