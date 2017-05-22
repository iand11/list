helpers do 

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  
  def user(phone_number, body)
    @user = User.find_by(phone_number: phone_number[1..-1])
    if @user && body == "show"
      show_entries
    elsif @user && body[0..2] == "add"
      task = body[4..-1]
      Entry.create(description:"#{task}", completed: false, user_id:"#{@user.id}")
      show_entries
    elsif @user && body[0..5] == "delete"
      task = body[7..-1]
      @entry = Entry.find_by(description: task)
      if @entry
        @entry.completed = "true"
        @entry.save
        show_entries
      else
        "there is no task #{task}"
      end 
    else
      "you are not a registered user"
    end 
  end

  def show_entries
      array = []
      @user.entries.each do |item|
        array << item.description + "," if !item.completed
      end 
      array.join(" ")
  end

end 