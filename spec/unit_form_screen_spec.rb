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
    form_controller.sections.count.should == 4
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

    field.cellClass.should == MyCustomCell
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

  it "allows cell customization from the hash" do
    field = form_controller.sections[1].fields[0]
    settings = field.cellConfig # returns hash of custom settings
    settings.include?("textLabel.color").should == true
    settings["textLabel.color"].should == UIColor.blueColor
    settings.include?("textLabel.font").should == true
    settings["textLabel.font"].should == UIFont.fontWithName('Helvetica-Light', size: 25)
    settings.include?("backgroundColor").should == true
    settings["backgroundColor"].should == UIColor.lightGrayColor
  end

  it "allows the user to set a cell image" do
    field = form_controller.sections[3].fields[0]
    settings = field.cellConfig
    settings['imageView.image'].class.should == UIImage
  end

  it "allows the user to set an image with a string" do
    field = form_controller.sections[3].fields[1]
    settings = field.cellConfig
    settings['imageView.image'].class.should == UIImage
  end
end
