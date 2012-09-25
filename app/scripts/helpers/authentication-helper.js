var AuthenticationHelper;

AuthenticationHelper = (function() {

  function AuthenticationHelper(user) {
    this.user = user;
  }

  AuthenticationHelper.doAuthentication = function(user) {
    if (user.hasAccessToken) {
      return console.log("has access token");
    } else {
      return this.createLoginLink();
    }
  };

  AuthenticationHelper.createLoginLink = function() {
    var tokenRequestURL;
    this.googleOauthConfig = new GoogleOAuth2Config();
    tokenRequestURL = this.googleOauthConfig.createRequestURL();
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

  return AuthenticationHelper;

})();
