module ProMotion
  class FormStyle < Hash
    def initialize(obj=nil)
      replace(obj) if obj.kind_of? Hash
    end

    def +(obj)
      merge(obj)
    end

    def <<(obj)
      merge!(obj)
    end
  end
end
