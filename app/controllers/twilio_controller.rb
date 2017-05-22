post '/receive_sms' do 
  # @entry = Entry.all

  # @array = []
  # @entry.each do |entry|
  #   @array << entry.description 
  # end
  # x = @array.join(" ") 

  # response = Twilio::TwiML::Response.new do |r|
  #   r.Message 'Hi there!'
  # end 

  # response.to_xml

  number = params["From"]
  body = params["Body"]
  p "*" * 100
  p number
  x = user(number, body)
  content_type 'text/xml'
  "<Response>
    <Message>
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

