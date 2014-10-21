class MyCustomCell < FXFormTextFieldCell
  def setUp
    super # optional
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
