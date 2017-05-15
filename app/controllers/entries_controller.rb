get '/entries/new' do 
  if current_user
    erb :'/entries/new'
  else  
    erb :'/sessions/new'
  end 
end 

post '/entries' do 
  @entry = Entry.new(params[:entry])
  if request.xhr?
    if @entry.save
      erb :"_entry_partial", layout: false, locals:{entry: @entry}
    else
      @errors = @entry.errors.full_messages
      erb :'/entries/new'
    end
  else
    if @entry.save
      redirect '/'
    else
      @errors = @entry.errors.full_messages
      erb :'/entries/new'
    end
  end 
end 

get '/entries/:id/edit' do 
  @entry = Entry.find(params[:id])
  if request.xhr?
    erb :"_edit_partial", layout: false 
  else
    erb :'/entries/edit'
  end
end 

patch '/entries/:id' do   
  @entry = Entry.find(params[:id])
  @entry.update(params[:entry])
  if request.xhr?
    erb :'_display_partial', layout: false, locals:{entry: @entry}
  else
    redirect '/'
  end 
end 