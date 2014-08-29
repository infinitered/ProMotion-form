describe "ProMotion::TestFormScreen functionality" do
  tests TestFormScreen

  def form_screen
    @form_screen ||= TestFormScreen.new(nav_bar: true)
  end

  def controller
    form_screen.navigationController
  end

  after do
    @form_screen = nil
  end

  it "has a navigation bar" do
    form_screen.navigationController.should.be.kind_of(UINavigationController)
  end

end
