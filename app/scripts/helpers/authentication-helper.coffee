class AuthenticationHelper
  constructor: (@user) ->
    
  @doAuthentication: (user) ->
    if user.hasAccessToken
      console.log("has access token")
    else
      @createLoginLink()
    
  @createLoginLink: ->
    this.googleOauthConfig = new GoogleOAuth2Config()
    tokenRequestURL = this.googleOauthConfig.createRequestURL()
    $('#authentication>a').attr('href', tokenRequestURL)
    
  @readCookie: (name) ->
    key = name + "="
    cookieArr = document.cookie.split(';')
    for val in cookieArr
      while val.charAt(0) == ' '
        val = val.substring(1, val.length)
      if(val.indexOf(key) == 0)
        return val.substring(key.length, val.length)
    return null
  