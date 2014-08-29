module ProMotion
  module FormScreenModule

    def screen_setup

    end

    ########## Cocoa touch methods #################


    module FormClassMethods
      # Nothing yet!
    end

    def self.included(base)
      base.extend(FormClassMethods)
    end

  end
end
