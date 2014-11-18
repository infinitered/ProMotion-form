module ProMotion
  module FormScreenStyle
    def style(*ary)
      @form_styles ||= styles
      @form_styles_cache ||= {}
      @form_styles_cache[ary * ':'] ||= ary.inject(PM::FormStyle.new) do |all, one|
        one ? (all << @form_styles[one]) : all
      end
    end

    def style!(*ary)
      @form_style_sticky = ary.empty? ? nil : ary
      style(*ary)
    end

    def style?(*ary)
      ary.unshift(*@form_style_sticky) if @form_style_sticky
      style(*ary)
    end
  end
end
