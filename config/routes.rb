Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  get("/user", {:controller => "users", :action => "index"})
  
  get("/users/:path_id", {:controller => "users", :action => "show"})

  post("/add_user", { :controller => "users", :action => "create" })

  post("/user/:path_id", {:controller => "users", :action => "update"})



end
