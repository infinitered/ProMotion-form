module ProMotion
  class FormStyle < Hash
    def initialize(obj)
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
