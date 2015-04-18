# This fixes an issue with response json having spaces in the key names
# Particularity "primary admin"
module CoreExtensions
  class ActiveResource::Base
    alias_method :old_find_or_create_resource_for, :find_or_create_resource_for  unless self.respond_to?(:old_find_or_create_resource_for)

    def find_or_create_resource_for(name)
      name = name.to_s.titlecase.gsub(/\W+/, '').to_sym
      old_find_or_create_resource_for(name)
    end
  end
end