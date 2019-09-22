class UserCreator < ApplicationService
  attr_reader :name
  
  def initialize(name:)
    @name = name
  end

  def call
    user = User.new(name: @name)
    return OpenStruct.new(success?: true, user: user) if user.save
    
    OpenStruct.new(success?: false, error: user.error)
  end
end