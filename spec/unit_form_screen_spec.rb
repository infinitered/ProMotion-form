describe "ProMotion::TestFormScreen unit" do
  tests TestFormScreen

  def form_screen
    @form_screen ||= TestFormScreen.new(nav_bar: true)
  end

  def controller
    form_screen.navigationController
  end

  def form_controller
    form_screen.formController
  end

  after do
    @form_screen = nil
  end

  it "contains cells" do
    form_controller.sections[0].fields.count.should == 2
    form_controller.sections[1].fields.count.should == 1
  end

  it "contains sections" do
    form_controller.sections.count.should == 2
  end

  it "provides a sensible default for cells without a :name" do
    field = form_controller.sections[1].fields[0]

    field.class.should == FXFormField
    field.title.should == "Cell Without A Name"
    field.key.should == "cell_without_a_name"
  end

end
