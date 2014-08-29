module ProMotion
  class FormScreen < FXFormController
    include ProMotion::ScreenModule

    def screen_setup
      self.formController.form = PM::Form.new(self.form_data)
    end

  end
end
