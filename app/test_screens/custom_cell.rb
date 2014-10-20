class MyCustomCell < FXFormBaseCell

  def setUp
    puts "Cell was set up"
    @set_up = true
    super # optional
  end

  def update
    puts "Cell was updated"
    super # optional
  end

  def didSelectWithTableView(tableView, controller:controller)
    puts "Cell was selected"
    super # optional
  end

  def set_up?
    @set_up || false
  end

end
