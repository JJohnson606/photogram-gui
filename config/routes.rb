Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  get("/user", {:controller => "users", :action => "index"})


end
