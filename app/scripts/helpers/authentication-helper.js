var AuthenticationHelper;

AuthenticationHelper = (function() {

  function AuthenticationHelper(user) {
    this.user = user;
  }

  AuthenticationHelper.doAuthentication = function(user) {
    var accessToken, userInfoUrl;
    accessToken = this.readCookie("accessToken");
    user.set({
      accessToken: accessToken
    });
    if (user.hasValidAccessToken()) {
      userInfoUrl = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken;
      console.log(userInfoUrl);
      user.url = userInfoUrl;
      console.log(user.get("url"));
      return user.fetch({
        success: function(model, response) {
          console.log("success");
          console.log(response);
          return console.log(user.get("name"));
        },
        error: function(model, response) {
          return console.log(response);
        }
      });
    } else {
      this.createLoginLink();
      return console.log("false");
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
