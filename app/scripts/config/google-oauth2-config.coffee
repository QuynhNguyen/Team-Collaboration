class GoogleOAuth2Config
  
  @GET_INFO_ENDPOINT = "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
  @END_POINT = "https://accounts.google.com/o/oauth2/auth"
  @RESPONSE_TYPE = "token"
  @CLIENT_ID = "#{GlobalConfig.GoogleOauth.client_id}"
  @REDIRECT_URI = encodeURIComponent("#{GlobalConfig.FrontEnd.server}:#{GlobalConfig.FrontEnd.port}/oauth2callback.html")
  @SCOPE = encodeURIComponent("https://www.googleapis.com/auth/userinfo.profile")
  @STATE = encodeURIComponent("")
  @OPTION_ARGUMENT = "&approval_prompt=auto"
    
  @createRequestURL: =>
    requestURL = "#{@END_POINT}?scope=#{@SCOPE}&state=#{@STATE}&client_id=#{@CLIENT_ID}&response_type=#{@RESPONSE_TYPE}&redirect_uri=#{@REDIRECT_URI}#{@OPTION_ARGUMENT}"
    
  @createGetUserInfoURL: (token) =>
    requestURL = "#{@GET_INFO_ENDPOINT}#{token}"
    
    