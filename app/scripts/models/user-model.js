
TeamCollaboration.UserModel = Backbone.Model.extend({
  defaults: {
    name: "guest",
    picture: "",
    isLoggedIn: false
  },
  hasAccessToken: function() {
    var accessToken;
    accessToken = AuthenticationHelper.readCookie("accessToken");
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }
});
