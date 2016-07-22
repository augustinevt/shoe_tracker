require 'bundler/setup'

Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  erb :index
end

get('/stores/new') do
  erb(:new_store)
end

post('/stores/create') do
  @store = Store.create(name: params['name'], location: params['location'])
  redirect "/stores/#{@store.id()}"
end

get('/stores/:id/edit') do
  @store = Store.find(params['id'])
  erb(:store_edit)
end

patch('/stores/:id') do
  @store = Store.find(params['id'])
  @store.update(name: params['name'], location: params['location'])
  redirect "/stores/#{@store.id()}"
end

get('/stores/:id') do
  @store = Store.find(params['id'])
  erb(:store_show)
end

delete('/stores/:id') do
  @store = Store.find(params['id']).destroy()
  redirect '/'
end

post('/brands/create') do
  @store = Store.find(params['store_id'])
  @brand = Brand.exists?(name: params['brand_name']) ? Brand.find_by_name(params['brand_name']).id : nil
  if !(@brand) && !(@store.brand_ids.include? @brand)
    @brand = Brand.create(name: params['brand_name'])
    @store.brands.push(@brand)
    redirect "/stores/#{@store.id()}"
  else
    redirect "/stores/#{@store.id()}"
  end
end

patch('/brands/:id') do
  redirect "/"
end
