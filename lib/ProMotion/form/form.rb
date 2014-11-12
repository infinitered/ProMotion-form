module ProMotion
  class Form
    attr_reader :form_data

    def initialize(form_data)
      @form_data = form_data
    end

    # Smartly creates a "dumb" FXForms-compatible form object.
    # It contains the values for every field and also has the
    # instructions on how to build the form.
    def build
      props = properties
      form_struct = Struct.new(:fields, *props) do
        props.each do |p|
          alias_method "set#{p.capitalize}:", "#{p}="
        end
      end
      form_struct.new(form_fields, *values)
    end

  private

    def fields
      @fields ||= begin
        header = nil
        form_data.map do |section|
          rows = Array(section[:cells]).map{ |input| input_data(input) }
          rows.first[:header] = section[:title] if section[:title] && rows.length > 0
          rows.last[:footer] = section[:footer] if section[:footer] && rows.length > 0
          rows
        end.flatten
      end
    end

    def properties
      fields.map{ |f| f[:key] }
    end

    def values
      fields.map{ |f| get_value(f) }
    end

    def form_fields
      fields.map{ |f| f.dup.tap{|f2| f2.delete(:value) } }
    end

    def input_data(input)
      data = {}

      # set data with non-helper keys
      helpers = [ :name, :cell_class ]
      (input.keys - helpers).each {|key| data[key] = input[key] }

      # implement helpers
      data[:key  ] ||= input[:name ] || input[:title].downcase.gsub(/[^0-9a-z]/i, '_').to_sym
      data[:title] ||= input[:label] || input[:name ].to_s
      data[:cell ] ||= input[:cell_class] if input[:cell_class]

      data
    end

    def get_value(f)
      f[:value] || begin
        case f[:type]
        when :date then NSDate.date
        when :time then NSDate.date
        else ""
        end
      end
    end
  end
end

# static NSString *const key = @"key";
# static NSString *const FXFormFieldType = @"type";
# static NSString *const FXFormFieldClass = @"class";
# static NSString *const cell = @"cell";
# static NSString *const title = @"title";
# static NSString *const placeholder = @"placeholder";
# static NSString *const default = @"default";
# static NSString *const options = @"options";
# static NSString *const FXFormFieldTemplate = @"template";
# static NSString *const valueTransformer = @"valueTransformer";
# static NSString *const action = @"action";
# static NSString *const FXFormFieldSegue = @"segue";
# static NSString *const header = @"header";
# static NSString *const FXFormFieldFooter = @"footer";
# static NSString *const FXFormFieldInline = @"inline";
# static NSString *const FXFormFieldSortable = @"sortable";
# static NSString *const FXFormFieldViewController = @"viewController";

# static NSString *const FXFormFieldTypeDefault = @"default";
# static NSString *const FXFormFieldTypeLabel = @"label";
# static NSString *const FXFormFieldTypeText = @"text";
# static NSString *const :longtext = @"longtext";
# static NSString *const FXFormFieldTypeURL = @"url";
# static NSString *const FXFormFieldTypeEmail = @"email";
# static NSString *const FXFormFieldTypePhone = @"phone";
# static NSString *const FXFormFieldTypePassword = @"password";
# static NSString *const FXFormFieldTypeNumber = @"number";
# static NSString *const FXFormFieldTypeInteger = @"integer";
# static NSString *const FXFormFieldTypeUnsigned = @"unsigned";
# static NSString *const FXFormFieldTypeFloat = @"float";
# static NSString *const :bitfield = @"bitfield";
# static NSString *const FXFormFieldTypeBoolean = @"boolean";
# static NSString *const :option = @"option";
# static NSString *const FXFormFieldTypeDate = @"date";
# static NSString *const FXFormFieldTypeTime = @"time";
# static NSString *const FXFormFieldTypeDateTime = @"datetime";
# static NSString *const FXFormFieldTypeImage = @"image";

