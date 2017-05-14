get '/sessions/new' do 
  erb :'/sessions/new'
end 

post '/sessions' do 
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ['incorrect username or password']
    erb :'/sessions/new'
  end
end

delete '/sessions/logout' do 
  session.delete(:user_id)
  redirect '/'
end  