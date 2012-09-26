
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "renderFrontpageView",
    "admin": "renderAdminView",
    "admin/project-management": "renderProjectManagementView",
    "login/:accessToken/:state": "doAuthentication"
  },
  initialize: function() {
    this.user = new TeamCollaboration.UserModel();
    this.loginView = new TeamCollaboration.LoginView({
      model: this.user
    });
    this.loginView.render();
    return AuthenticationHelper.doAuthentication(this.user);
  },
  createProjectManagementSideBar: function() {
    if (this.projectManagementSideBar === void 0) {
      this.projectCollection = new TeamCollaboration.ProjectCollection();
      this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({
        collection: this.projectCollection
      });
      this.ProjectManagementSideBar.render();
      return this.projectCollection.fetch();
    }
  },
  doAuthentication: function(accessToken, state) {
    console.log(decodeURIComponent(state));
    return this.navigate(decodeURIComponent(state));
  },
  renderFrontpageView: function() {
    console.log(this.user);
    return this.createProjectManagementSideBar();
  },
  renderAdminView: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    this.adminMain = new TeamCollaboration.AdminMain();
    this.adminMain.render();
    return this.adminSideBar.render();
  },
  renderProjectManagementView: function() {
    this.createProjectManagementSideBar();
    this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({
      collection: this.projectCollection
    });
    return this.projectManagementMain.render();
  }
});
