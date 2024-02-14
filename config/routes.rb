Rails.application.routes.draw do


  get("/", {:controller => "users", :action => "index"})

  get("/users", {:controller => "users", :action => "index"})
  
  get("/users/:path_id", {:controller => "users", :action => "show"})

  post("/add_user", { :controller => "users", :action => "create" })

  post("/update_user/:path_id", {:controller => "users", :action => "update"})

  get("/delete_user/:path_id", {:controller => "users", :action => "destroy"})
  
  get("/photos", {:controller => "photos", :action => "index"})

  get("/photos/:path_id", {:controller => "photos", :action => "show"})

  post("/insert_photo_record", {:controller => "photos", :action => "create"})

  post("/update_photo/:path_id", {:controller => "photos", :action => "update"})

  post("/add_comment", {:controller => "photos", :action => "create_comment"})

  get("/delete_photo/:path_id", {:controller => "photos", :action => "destroy"})



end
