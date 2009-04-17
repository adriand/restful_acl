Gem::Specification.new do |s|
  s.name     = "adriand-restful_acl"
  s.version  = "2.0.7"
  s.date     = "2009-04-16"
  s.summary  = "Object-level access control"
  s.email    = "adrianduyzer@gmail.com"
  s.homepage = "http://github.com/adriand/restful_acl"
  s.description = "A Rails gem that provides fine grained access control to RESTful resources in a Rails 2.0+ application."
  s.has_rdoc = false
  s.authors  = ["Matt Darby", "Adrian Duyzer"]
  s.files    = [
    "MIT-LICENSE",
    "README.textile",
    "Rakefile",
    "init.rb",
    "install.rb",
    "lib/restful_acl_controller.rb",
    "lib/restful_acl_helper.rb",
    "lib/restful_acl_model.rb",
    "rails/init.rb",
    "uninstall.rb"
  ]
end