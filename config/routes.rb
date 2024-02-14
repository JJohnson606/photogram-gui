Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})
  
  get("/users/:path_id", {:controller => "users", :action => "show"})

  post("/add_user", { :controller => "users", :action => "create" })

  post("/update_user/:path_id", {:controller => "users", :action => "update"})

  get("/photos", {:controller => "photos", :action => "index"})

end
