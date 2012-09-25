class AuthenticationHelper
  constructor: (@user) ->
    
  @doAuthentication: (user) ->
    accessToken = @readCookie("accessToken")
    user.set({accessToken:accessToken})
    if user.hasValidAccessToken()
      ##Fetch user information and store inside user object
      userInfoUrl = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{accessToken}"
      console.log(userInfoUrl)
      user.url = userInfoUrl
      console.log(user.get("url")) 
      user.fetch(
        success: (model, response) ->
          console.log("success")
          console.log(response)
          console.log(user.get("name"))
        error: (model, response) ->
          console.log(response)
      )

    else
      @createLoginLink()
      console.log("false")
    
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
  