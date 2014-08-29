module ProMotion
  class Form
    attr_accessor :form_data

    def initialize(form_data)
      @form_data = form_data
    end

    def fields
      example_fields
    end

    def example_fields
      [
        {
          key: "email",
          header: "Account"
        },
        "password",
        "repeatPassword",
        {
          key: "name",
          header: "Details",
          "textField.autocapitalizationType" => UITextAutocapitalizationTypeWords
        },
        {
          key: "gender",
          options: [ "Male", "Female", "It's Complicated" ]
        },
        "dateOfBirth",
        "profilePhoto",
        "phone",
        {
          key: "country",
          options: [ "us", "ca", "gb", "sa", "be"],
          default: "us",
          valueTransformer: ISO3166CountryValueTransformer.alloc.init
        },
        {
          key: "language",
          options: [ "English", "Spanish", "French", "Dutch" ],
          default: "English",
          cell: FXFormOptionPickerCell
        },
        {
          key: "interests",
          default: "Videogames",
          options: [ "Videogames", "Animals", "Cooking" ]
        },
        {
          key: "otherInterests",
          type: :bitfield,
          default: "InterestComputers",
          options: [ "Computers", "Socializing", "Sports" ]
        },
        {
          key: "about",
          type: :longtext,
          placeholder: "Text..."
        },
        {
          header: "Plan",
          key: "plan",
          title: "",
          placeholder: "Free",
          options: [ "Micro", "Normal", "Maxi" ],
          cell: FXFormOptionSegmentsCell
        },
        {
          key: "termsAndConditions",
          header: "Legal"
        },
        "privacyPolicy",
        {
          key: "agreedToTerms",
          title: "I Agree To These Terms",
          type: :option
        },
        {
          title: "Submit",
          header: "",
          action: "submitRegistrationForm:"
        },
      ]
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

