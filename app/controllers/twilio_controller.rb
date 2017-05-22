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

post '/send_sms' do 
  to = params["to"]
  message = params["body"]

  client = Twilio::REST::Client.new(
    "AC36059c5195328933be6d8f21067c4c6b",
    "0bf1309e2789d7d967bfbb8b55a96d1d"
    )
  client.message.create(
    to: to,
    from: "+15162102506",
    body: message
    )
end 

