module ProMotion
  class FormScreen < FormViewController
    include ProMotion::ScreenModule
    include ProMotion::FormScreenStyle

    attr_reader :form_object

    def viewDidLoad
      super
      update_form_data
    end

    def form_data
      mp "You need to implement a `form_data` method in #{self.class.to_s}."
      []
    end

    def update_form_data
      @form_object = PM::Form.new(self.form_data).build
      self.formController.form = @form_object
      self.formController.delegate = self
      self.view.reloadData
    end

    def dismiss_keyboard
      self.view.endEditing true
    end

    def render_form
      Hash[form_object.each_pair.to_a].tap{|h| h.delete(:fields) }
    end
  end
end
