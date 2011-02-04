namespace :illustrations do
  desc "Upload all illustrations in default illustration upload directory"
  task :upload => :environment do
    default_license_id = License.all[0].id
    Dir.chdir(ENV['ILLUSTRATION_DIR'])
    Dir.glob("*").each do |category_name|
      if File.directory?(category_name)
        Dir.chdir(category_name) do
          puts "Creating category: " + category_name
          category_instance = Category.new
          category_instance.name_en = category_name
          category_instance.name_nl = category_name
          category_instance.save!
          puts ""
          Dir.glob("*").sort.each do |gallery_name|
            if File.directory?(gallery_name)
              Dir.chdir(gallery_name) do
                puts "Creating gallery: " + gallery_name
                gallery_instance = category_instance.galleries.new
                gallery_instance.name_en = gallery_name
                gallery_instance.name_nl = gallery_name
                gallery_instance.year = 2010
                gallery_instance.license_id = default_license_id
                gallery_instance.save!
                puts ""
                Dir.glob("*.{jpg, jpeg}").sort.each do |illustration_path|
                  puts "Processing image: " + illustration_path
                  illustration_instance = gallery_instance.illustrations.new
                  illustration_instance.image = File.open(illustration_path)
                  illustration_name = File.basename(illustration_path, File.extname(illustration_path))
                  illustration_instance.name_en = illustration_name
                  illustration_instance.name_nl = illustration_name
                  illustration_instance.year = 2010
                  illustration_instance.license_id = default_license_id
                  illustration_instance.save!
                end
                puts ""
              end
            end
          end
        end
      end
    end
  end
  
  desc "Create sorted order for unordered galleries"
  task :order => :environment do
    Gallery.all.each do |gallery|
      if gallery.illustrations.first.sorted_order == 0 # assume it's sortin' time
        puts "Adding sort for gallery: " + gallery.name_en
        order_count = 1
        gallery.illustrations.all.each do |ill|
          ill.sorted_order = order_count
          ill.save
          order_count += 1
        end
      else
        puts "Already sorted: " + gallery.name_en
      end      
    end
  end
end