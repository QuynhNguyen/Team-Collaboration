
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "renderFrontpageView",
    "admin": "renderAdminView",
    "admin/project-management": "renderProjectManagementView"
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
  renderFrontpageView: function() {
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
