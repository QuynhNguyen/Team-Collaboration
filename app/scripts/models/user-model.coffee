TeamCollaboration.UserModel = Backbone.Model.extend(

  defaults:
    name: "guest"
    picture: ""
    isLoggedIn: false
    
  hasAccessToken: ->
    accessToken = AuthenticationHelper.readCookie("accessToken")
    if accessToken? then true else false

)