class User < ActiveRecord::Base
  has_many :entries

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true 

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(plain_text_password)
    @password = Password.create(plain_text_password)
    self.hashed_password = @password
  end

  def name_for_header
    self.first_name + "'s" + " list"
  end

end
