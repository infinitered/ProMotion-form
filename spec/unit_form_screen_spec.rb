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

  before { form_screen.update_form_data }
  after { @form_screen = nil }

  it "contains sections" do
    form_controller.sections.count.should == 3
  end

  it "contains cells" do
    form_controller.sections[0].fields.count.should == 3
    form_controller.sections[1].fields.count.should == 1
  end

  it "provides a sensible default for cells without a :name" do
    field = form_controller.sections[1].fields[0]

    field.class.should == FXFormField
    field.title.should == "Cell Without A Name"
    field.key.should == :cell_without_a_name
  end

  it "can use custom cell classes" do
    field = form_controller.sections[2].fields[0]

    field.cell.should == MyCustomCell
    view("Cell Updated").should.not.be.nil
  end

  it "provides a sensible default for cells without a :value" do
    field0 = form_controller.sections[0].fields[0]
    field1 = form_controller.sections[0].fields[1]
    field2 = form_controller.sections[0].fields[2]

    field0.value.should == "jamon@example.com"
    field1.value.should == ""
    field2.value.to_s.should == NSDate.date.to_s
  end

end
