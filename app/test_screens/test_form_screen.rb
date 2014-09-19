class TestFormScreen < PM::FormScreen
  title "Account info"

  def form_data
    [{
      title: "Account Information",
      footer: "Some help text",
      cells: [{
        name: "email",
        title: "Email",
        type: :email,
        value: current_user.email,
      }, {
        name: "password",
        title: "Password",
        type: :password,
        value: ""
      }]
    }]
  end

  def current_user
    Struct.new(:email, :password).new("jamon@example.com", "testing123456")
  end

end
