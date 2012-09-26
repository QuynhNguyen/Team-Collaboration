var AuthenticationHelper;

AuthenticationHelper = (function() {

  function AuthenticationHelper() {}

  AuthenticationHelper.doAuthentication = function(user) {
    var accessToken, userInfoUrl;
    accessToken = this.readCookie("accessToken");
    user.set({
      accessToken: accessToken
    });
    if (user.hasValidAccessToken()) {
      userInfoUrl = GoogleOAuth2Config.createGetUserInfoURL(accessToken);
      user.url = userInfoUrl;
      return user.trigger('url:changed');
    }
  };

  AuthenticationHelper.createLoginLink = function() {
    var tokenRequestURL;
    tokenRequestURL = GoogleOAuth2Config.createRequestURL();
    return $('#authentication>a').attr('href', tokenRequestURL);
  };

  AuthenticationHelper.readCookie = function(name) {
    var cookieArr, key, val, _i, _len;
    key = name + "=";
    cookieArr = document.cookie.split(';');
    for (_i = 0, _len = cookieArr.length; _i < _len; _i++) {
      val = cookieArr[_i];
      while (val.charAt(0) === ' ') {
        val = val.substring(1, val.length);
      }
      if (val.indexOf(key) === 0) {
        return val.substring(key.length, val.length);
      }
    }
    return null;
  };

  AuthenticationHelper.deleteCookie = function(name) {
    return document.cookie = "" + name + "=; expires=Thu, 01 Jan 1970 00:00:01 GMT";
  };

  return AuthenticationHelper;

})();
