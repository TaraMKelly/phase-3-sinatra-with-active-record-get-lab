class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the bakery in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods' do
    baked_goods = BakedGood.all
    baked_goods.to_json
  end

  get '/baked_goods/by_price' do
    pastries_by_price = BakedGood.by_price
    pastries_by_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.by_price.first
    most_expensive.to_json
  end

end
