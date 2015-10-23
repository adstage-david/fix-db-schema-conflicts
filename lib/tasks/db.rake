namespace :db do
  namespace :schema do
    task :dump do
      puts "Dumping database schema with fix-db-schema-conflicts gem"
      filename = ENV['SCHEMA'] || if defined? ActiveRecord::Tasks::DatabaseTasks
        File.join(ActiveRecord::Tasks::DatabaseTasks.db_dir, 'schema.rb')
      else
        "#{Rails.root}/db/schema.rb"
      end
      `sed -E -e 's/, +/, /g' #{filename} > db/schema.fixed.rb`
      `mv db/schema.fixed.rb #{filename}`
    end
  end
end
