class AuthenticationHelper

  @doAuthentication: (user) ->
    accessToken = @readCookie("accessToken")
    user.set({accessToken:accessToken})
    if user.hasValidAccessToken()
      ## Store Valid Access Token Into User Object ##
      userInfoUrl = GoogleOAuth2Config.createGetUserInfoURL(accessToken)
      user.url = userInfoUrl
      user.trigger('url:changed')
    
  @createLoginLink: ->
    tokenRequestURL = GoogleOAuth2Config.createRequestURL()
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
    
  @deleteCookie: (name) ->
    document.cookie = "#{name}=; expires=Thu, 01 Jan 1970 00:00:01 GMT"
  