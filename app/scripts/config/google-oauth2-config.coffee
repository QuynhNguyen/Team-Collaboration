class GoogleOAuth2Config
  constructor: (
    @END_POINT = "https://accounts.google.com/o/oauth2/auth", 
    @RESPONSE_TYPE = "token", 
    @CLIENT_ID = "66486550334.apps.googleusercontent.com", 
    @REDIRECT_URI = encodeURIComponent("http://localhost:3501/oauth2callback.html"), 
    @SCOPE = encodeURIComponent("https://www.googleapis.com/auth/userinfo.profile"),
    @STATE = encodeURIComponent("http://localhost:3501/#/"),
    @OPTION_ARGUMENT = "&approval_prompt=force") -> 
    
  createRequestURL: =>
    ###
    https://accounts.google.com/o/oauth2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=%2Fprofile&redirect_uri=http://localhost:3501/oauth2callback.html&response_type=token&client_id=66486550334.apps.googleusercontent.com&approval_prompt=force
    ###
    requestURL = "#{@END_POINT}?scope=#{@SCOPE}&state=#{@STATE}&client_id=#{@CLIENT_ID}&response_type=#{@RESPONSE_TYPE}&redirect_uri=#{@REDIRECT_URI}#{@OPTION_ARGUMENT}"
    
    
    