var GoogleOAuth2Config;

GoogleOAuth2Config = (function() {

  function GoogleOAuth2Config() {}

  GoogleOAuth2Config.GET_INFO_ENDPOINT = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

  GoogleOAuth2Config.END_POINT = "https://accounts.google.com/o/oauth2/auth";

  GoogleOAuth2Config.RESPONSE_TYPE = "token";

  GoogleOAuth2Config.CLIENT_ID = "" + GlobalConfig.GoogleOauth.client_id;

  GoogleOAuth2Config.REDIRECT_URI = encodeURIComponent("" + GlobalConfig.FrontEnd.server + ":" + GlobalConfig.FrontEnd.port + "/oauth2callback.html");

  GoogleOAuth2Config.SCOPE = encodeURIComponent("https://www.googleapis.com/auth/userinfo.profile");

  GoogleOAuth2Config.STATE = encodeURIComponent("");

  GoogleOAuth2Config.OPTION_ARGUMENT = "&approval_prompt=auto";

  GoogleOAuth2Config.createRequestURL = function() {
    var requestURL;
    return requestURL = "" + GoogleOAuth2Config.END_POINT + "?scope=" + GoogleOAuth2Config.SCOPE + "&state=" + GoogleOAuth2Config.STATE + "&client_id=" + GoogleOAuth2Config.CLIENT_ID + "&response_type=" + GoogleOAuth2Config.RESPONSE_TYPE + "&redirect_uri=" + GoogleOAuth2Config.REDIRECT_URI + GoogleOAuth2Config.OPTION_ARGUMENT;
  };

  GoogleOAuth2Config.createGetUserInfoURL = function(token) {
    var requestURL;
    return requestURL = "" + GoogleOAuth2Config.GET_INFO_ENDPOINT + token;
  };

  return GoogleOAuth2Config;

}).call(this);
