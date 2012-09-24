
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "frontpageView",
    "admin": "adminView",
    "admin/project-management": "adminProjectManagementView"
  },
  initialize: function() {
    return this.projectCollection = new TeamCollaboration.ProjectCollection();
  },
  createProjectManagementSideBar: function() {
    if (this.projectManagementSideBar === void 0) {
      this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({
        collection: this.projectCollection
      });
      this.ProjectManagementSideBar.render();
      return this.projectCollection.fetchIfEmpty();
    }
  },
  frontpageView: function() {
    return this.createProjectManagementSideBar();
  },
  adminView: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    this.adminMain = new TeamCollaboration.AdminMain();
    this.adminMain.render();
    return this.adminSideBar.render();
  },
  adminProjectManagementView: function() {
    this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({
      collection: this.projectCollection
    });
    this.projectManagementMain.render();
    return this.createProjectManagementSideBar();
  }
});
