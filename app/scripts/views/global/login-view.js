var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.LoginView = (function(_super) {

  __extends(LoginView, _super);

  function LoginView() {
    return LoginView.__super__.constructor.apply(this, arguments);
  }

  LoginView.prototype.events = {
    "click #logout": "logout"
  };

  LoginView.prototype.el = $('#authentication');

  LoginView.prototype.login_template = _.template($('#tpl-login-btn').html());

  LoginView.prototype.welcome_template = _.template($('#tpl-welcome-user').html());

  LoginView.prototype.initialize = function() {
    var self;
    self = this;
    return this.model.on('url:changed', this.fetchUserInfo, this);
  };

  LoginView.prototype.logout = function() {
    AuthenticationHelper.deleteCookie("accessToken");
    return window.location = "/";
  };

  LoginView.prototype.renderLogin = function() {
    this.$el.html(this.login_template());
    return AuthenticationHelper.createLoginLink();
  };

  LoginView.prototype.renderWelcome = function() {
    return this.$el.html(this.welcome_template(this.model.toJSON()));
  };

  LoginView.prototype.fetchUserInfo = function(e) {
    var self;
    self = this;
    return this.model.fetch({
      error: function(model, response) {
        return window.location = GoogleOAuth2Config.createRequestURL();
      },
      success: function(model, response) {
        return self.render();
      }
    });
  };

  LoginView.prototype.render = function() {
    if (this.model.hasValidAccessToken()) {
      this.renderWelcome();
      return $('#logout').tooltip();
    } else {
      return this.renderLogin();
    }
  };

  return LoginView;

})(Backbone.View);
