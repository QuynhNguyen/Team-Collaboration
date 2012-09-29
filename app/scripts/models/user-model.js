var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.UserModel = (function(_super) {

  __extends(UserModel, _super);

  function UserModel() {
    return UserModel.__super__.constructor.apply(this, arguments);
  }

  UserModel.prototype.defaults = {
    name: "guest",
    picture: "",
    link: "",
    isLoggedIn: false,
    accessToken: null
  };

  UserModel.prototype.hasValidAccessToken = function() {
    if (this.get("accessToken") != null) {
      return true;
    } else {
      return false;
    }
  };

  return UserModel;

})(Backbone.Model);
