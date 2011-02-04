module LocalizedField
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def localized_field(*args)
      args.each do |field_name|
        self.class_eval %Q{
          def #{field_name}
            #{field_name}_#{I18n.locale.to_s}
          end
        }
      end
    end
  end
end
