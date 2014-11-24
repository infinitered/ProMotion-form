module ProMotion
  class FormStyle < Hash
    def initialize(obj=nil)
      replace(obj) if obj.kind_of? Hash
    end

    def +(obj)
      merge(obj || {})
    end

    def <<(obj)
      merge!(obj || {})
    end

    def self.to_style(obj, out={}, ary=[])
      obj.each do |key, val|
        case val
        when Hash  then next to_style(val, out, ary + [key.to_s])
        when Class then val = val.new
        when Proc  then val = val.call
        end
        all = (ary + [key.to_s]) * '.'
        val ? (out[all] = val) : out.delete(all)
      end
      out
    end
  end
end
