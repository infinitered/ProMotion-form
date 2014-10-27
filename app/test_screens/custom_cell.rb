# class MyButtonCell < FXFormBaseCell -> empty, where you add your own items
class MyCustomCell < FXFormTextFieldCell

  def setUp
    super # optional
    self.backgroundColor = UIColor.redColor
  end

  def update
    super # optional

    # Overwrite the title specified in the form hash
    # so we can test that the custom cell updated properly
    self.textField.text = "Cell Updated"
  end

  def didSelectWithTableView(tableView, controller:controller)
    super # optional
  end

end
