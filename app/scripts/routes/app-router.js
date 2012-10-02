var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.Router = (function(_super) {

  __extends(Router, _super);

  function Router() {
    return Router.__super__.constructor.apply(this, arguments);
  }

  Router.prototype.routes = {
    "": "renderFrontpageView",
    "admin": "renderAdminView",
    "admin/project-management": "renderProjectManagementView",
    "login/:accessToken/:state": "doAuthentication"
  };

  Router.prototype.initialize = function() {
    this.user = new TeamCollaboration.UserModel();
    this.loginView = new TeamCollaboration.LoginView({
      model: this.user
    });
    this.loginView.render();
    return AuthenticationHelper.doAuthentication(this.user);
  };

  Router.prototype.createProjectManagementSideBar = function(path) {
    if (this.projectManagementSideBar === void 0) {
      this.projectCollection = new TeamCollaboration.ProjectCollection();
      this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({
        collection: this.projectCollection,
        path: path
      });
      this.ProjectManagementSideBar.render();
      return this.projectCollection.fetch();
    }
  };

  Router.prototype.doAuthentication = function(accessToken, state) {
    console.log(decodeURIComponent(state));
    return this.navigate(decodeURIComponent(state));
  };

  Router.prototype.renderFrontpageView = function() {
    return this.createProjectManagementSideBar(Backbone.history.fragment);
  };

  Router.prototype.renderAdminView = function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    this.adminMain = new TeamCollaboration.AdminMain();
    this.adminMain.render();
    return this.adminSideBar.render();
  };

  Router.prototype.renderProjectManagementView = function() {
    this.createProjectManagementSideBar(Backbone.history.fragment);
    this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({
      collection: this.projectCollection
    });
    return this.projectManagementMain.render();
  };

  return Router;

})(Backbone.Router);
