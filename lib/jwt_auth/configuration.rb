class Configuration
  attr_accessor :model_class
  attr_accessor :login_attribute
  attr_accessor :user_serializer

  def user_serializer
    @user_serializer || UserSerializer
  end

  class UserSerializer
    def render_show(user)
      { id: user.id }
    end
  end
end
