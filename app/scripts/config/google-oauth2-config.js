var GoogleOAuth2Config,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

GoogleOAuth2Config = (function() {

  function GoogleOAuth2Config(END_POINT, RESPONSE_TYPE, CLIENT_ID, REDIRECT_URI, SCOPE, STATE, OPTION_ARGUMENT) {
    this.END_POINT = END_POINT != null ? END_POINT : "https://accounts.google.com/o/oauth2/auth";
    this.RESPONSE_TYPE = RESPONSE_TYPE != null ? RESPONSE_TYPE : "token";
    this.CLIENT_ID = CLIENT_ID != null ? CLIENT_ID : "66486550334.apps.googleusercontent.com";
    this.REDIRECT_URI = REDIRECT_URI != null ? REDIRECT_URI : encodeURIComponent("http://localhost:3501/oauth2callback.html");
    this.SCOPE = SCOPE != null ? SCOPE : encodeURIComponent("https://www.googleapis.com/auth/userinfo.profile");
    this.STATE = STATE != null ? STATE : encodeURIComponent("http://localhost:3501/#/");
    this.OPTION_ARGUMENT = OPTION_ARGUMENT != null ? OPTION_ARGUMENT : "&approval_prompt=force";
    this.createRequestURL = __bind(this.createRequestURL, this);

  }

  GoogleOAuth2Config.prototype.createRequestURL = function() {
    /*
        https://accounts.google.com/o/oauth2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=%2Fprofile&redirect_uri=http://localhost:3501/oauth2callback.html&response_type=token&client_id=66486550334.apps.googleusercontent.com&approval_prompt=force
    */

    var requestURL;
    return requestURL = "" + this.END_POINT + "?scope=" + this.SCOPE + "&state=" + this.STATE + "&client_id=" + this.CLIENT_ID + "&response_type=" + this.RESPONSE_TYPE + "&redirect_uri=" + this.REDIRECT_URI + this.OPTION_ARGUMENT;
  };

  return GoogleOAuth2Config;

})();
