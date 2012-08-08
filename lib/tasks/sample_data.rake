namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Admin User",
                         :email => "admin@admin.example",
                         :password => "1234567",
                         :password_confirmation => "1234567")
    admin.toggle!(:admin)
    
   user = User.create!(:name => "Sample User",
                         :email => "user@user.example",
                         :password => "1234567",
                         :password_confirmation => "1234567")
    
    domain1 = Domain.create!(:name => "localhost:3001")
    domain2 = Domain.create!(:name => "localhost:3002")
    
    main1 = Main.create!(:title => "Main Page Title 1",
                         :content => "Content of main page 1",
                         :metadescription => "Meta description of main page",
                         :metakeywords => "Meta keywords of main page",
                         :head => "",
                         :contact => "Contact 12345",
                         :footer => "Footer here",
                         :counter => "",
                         :domain => domain1.id)
                         
     page1 = Page.create!(:name => "First Page 1",
                         :alias => "firstpage1",
                         :title => "Page Title 1",
                         :content => "Content of page 1",
                         :metadescription => "Meta description of page",
                         :metakeywords => "Meta keywords of page",
                         :head => "",
                         :ismenu => true,
                         :domain => domain1.id)
                         
     main2 = Main.create!(:title => "Main Page Title",
                         :content => "Content of main page",
                         :metadescription => "Meta description of main page",
                         :metakeywords => "Meta keywords of main page",
                         :head => "",
                         :contact => "Contact 12345",
                         :footer => "Footer here",
                         :counter => "",
                         :domain => domain2.id)
                         
     page2 = Page.create!(:name => "First Page 2",
                         :alias => "firstpage2",
                         :title => "Page Title 2",
                         :content => "Content of page 2",
                         :metadescription => "Meta description of page",
                         :metakeywords => "Meta keywords of page",
                         :head => "",
                         :ismenu => true,
                         :domain => domain2.id)
  

  end
end