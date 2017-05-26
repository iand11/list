post '/receive_sms' do 

  number = params["From"]
  body = params["Body"]
  x = user(number, body)
  person = User.find_by(phone_number: number[1..-1])
  content_type 'text/xml'
  "<Response>
    <Message>
    Hello #{person.first_name}
    Here are the items you still have to do: 
      #{x}
    </Message>
  </Response>"
  
end 



