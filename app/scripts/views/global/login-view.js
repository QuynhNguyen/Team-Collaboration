
TeamCollaboration.LoginView = Backbone.View.extend({
  events: {
    "click #logout": "logout"
  },
  el: $('#authentication'),
  login_template: _.template($('#tpl-login-btn').html()),
  welcome_template: _.template($('#tpl-welcome-user').html()),
  initialize: function() {
    var self;
    self = this;
    return this.model.on('url:changed', function() {
      return self.model.fetch({
        error: function(model, response) {
          return console.log("Fail to fetch " + model + " due to " + response);
        },
        success: function(model, response) {
          return self.render();
        }
      });
    });
  },
  logout: function() {
    AuthenticationHelper.deleteCookie("accessToken");
    return window.location = "/";
  },
  renderLogin: function() {
    this.$el.html(this.login_template());
    return AuthenticationHelper.createLoginLink();
  },
  renderWelcome: function() {
    console.log(this.model);
    return this.$el.html(this.welcome_template(this.model.toJSON()));
  },
  fetchUserInfo: function(e) {
    var self;
    console.log("chaning");
    self = this;
    return this.model.fetch({
      error: function(model, response) {
        return console.log("Fail to fetch " + model + " due to " + response);
      },
      success: function(model, response) {
        return self.render();
      }
    });
  },
  render: function() {
    if (this.model.hasValidAccessToken()) {
      return this.renderWelcome();
    } else {
      return this.renderLogin();
    }
  }
});