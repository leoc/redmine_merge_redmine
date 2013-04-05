class SourceRole < ActiveRecord::Base
  include SecondDatabase
  set_table_name :roles

  def self.migrate
    all.each do |source_role|
      # Only migrate the role if it doesn't already exist
      next if Role.find_by_name(source_role.name)

      Role.create!(source_role.attributes)
    end
  end
end
