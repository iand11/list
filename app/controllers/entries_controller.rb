get '/entries/new' do 
  if current_user
    erb :'/entries/new'
  else  
    erb :'/sessions/new'
  end 
end 

post '/entries' do 
  @entry = Entry.new(params[:entry])
  if @entry.save
    redirect '/'
  else
    @errors = @entry.errors.full_messages
    erb :'/entries/new'
  end
end 