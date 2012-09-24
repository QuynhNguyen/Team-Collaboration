
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "frontpageView",
    "admin": "adminView",
    "admin/project-management": "adminProjectManagementView"
  },
  initialize: function() {
    return this.projectCollection = new TeamCollaboration.ProjectCollection();
  },
  frontpageView: function() {
    this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({
      collection: this.projectCollection
    });
    this.adminProjectManagementSideBar.render();
    return this.projectCollection.fetchIfEmpty();
  },
  adminView: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    this.adminMain = new TeamCollaboration.AdminMain();
    this.adminMain.render();
    return this.adminSideBar.render();
  },
  adminProjectManagementView: function() {
    this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain({
      collection: this.projectCollection
    });
    this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({
      collection: this.projectCollection
    });
    this.projectCollection.fetchIfEmpty();
    this.adminProjectManagementMain.render();
    return this.adminProjectManagementSideBar.render();
  }
});
