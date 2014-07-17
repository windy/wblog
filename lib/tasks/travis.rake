namespace :travis do
  def verbose_system(*args)
    puts(args.join(' '))
    system(*args)
  end
  task :before_script do
    verbose_system("cp -f config/mongoid.yml.example config/mongoid.yml")
    verbose_system("cp -f config/application.yml.example config/application.yml")
  end

end
