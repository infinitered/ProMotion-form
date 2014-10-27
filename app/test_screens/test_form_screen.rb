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
      }, {
        name: "date",
        title: "Date",
        type: :date,
      }]
    }, {
      title: "Second Section",
      cells: [{
        title: "Cell Without A Name",
        value: "",
      }]
    }, {
      title: "Custom Cells",
      cells: [{
        title: "Test Cell",
        value: "Test Custom Class",
        cell_class: MyCustomCell
      }]
    }]
  end

  def current_user
    $junk = self
    Struct.new(:email, :password).new("jamon@example.com", "testing123456")
  end

end
