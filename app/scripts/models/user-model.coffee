TeamCollaboration.UserModel = Backbone.Model.extend(
  
  defaults:
    name: "guest"
    picture: ""
    link: ""
    isLoggedIn: false
    accessToken: null
    
  hasValidAccessToken: ->
    if @get("accessToken")? then true else false

)