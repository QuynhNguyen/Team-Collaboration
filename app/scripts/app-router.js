
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "frontpageView",
    "admin": "adminView",
    "admin/project-management": "adminProjectManagementView",
    "admin/project-management/edit": "adminProjectManagementView"
  },
  initialize: function() {},
  frontpageView: function() {
    this.projectCollection = new TeamCollaboration.ProjectCollection();
    this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({
      collection: this.projectCollection
    });
    this.projectCollection.fetch();
    return this.adminProjectManagementSideBar.render();
  },
  renderAdminMain: function() {
    this.adminMain = new TeamCollaboration.AdminMain();
    return this.adminMain.render();
  },
  renderAdminSideBar: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    return this.adminSideBar.render();
  },
  adminView: function() {
    this.renderAdminMain();
    return this.renderAdminSideBar();
  },
  adminProjectManagementView: function() {
    this.projectCollection = new TeamCollaboration.ProjectCollection();
    this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain({
      collection: this.projectCollection
    });
    this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({
      collection: this.projectCollection
    });
    this.projectCollection.fetch();
    this.adminProjectManagementMain.render();
    return this.adminProjectManagementSideBar.render();
  }
});
