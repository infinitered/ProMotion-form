module ProMotion
  class FormScreen < PM::FormViewController
    include ProMotion::ScreenModule

    attr_reader :form_object

    def viewDidLoad
      super
      update_form_data
    end

    def form_data
      PM.logger.info "You need to implement a `form_data` method in #{self.class.to_s}."
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

    def style(*ary)
      @form_styles ||= styles
      @form_styles_cache ||= {}
      @form_styles_cache[ary * ':'] ||= ary.inject(PM::FormStyle.new) {|all, one| all << @form_styles[one] }
    end

  end
end
