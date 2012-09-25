
TeamCollaboration.UserModel = Backbone.Model.extend({
  defaults: {
    name: "guest",
    picture: "",
    link: "",
    isLoggedIn: false,
    accessToken: null
  },
  hasValidAccessToken: function() {
    if (this.get("accessToken") != null) {
      return true;
    } else {
      return false;
    }
  }
});
