
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "": "frontpageView",
    "admin": "adminView",
    "admin/project-management": "adminProjectManagementView"
  },
  initialize: function() {},
  frontpageView: function() {
    this.frontpage = new TeamCollaboration.ApplicationView();
    return $('#sidebar').html(this.frontpage.render());
  },
  renderAdminMain: function() {
    this.adminMain = new TeamCollaboration.AdminMain();
    return $('#content').html(this.adminMain.render().el);
  },
  renderAdminSideBar: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    return $('#sidebar').html(this.adminSideBar.render());
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
    $('#content').html(this.adminProjectManagementMain.render().el);
    return $('#sidebar').html(this.adminProjectManagementSideBar.render().el);
  }
});
