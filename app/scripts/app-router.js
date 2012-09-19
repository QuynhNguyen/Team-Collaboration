
TeamCollaboration.Router = Backbone.Router.extend({
  routes: {
    "admin": "adminView",
    "admin/project-management": "adminProjectManagementView"
  },
  initialize: function() {},
  renderAdminMain: function() {
    this.adminMain = new TeamCollaboration.AdminMain();
    return $('#content').html(this.adminMain.render().el);
  },
  renderAdminSideBar: function() {
    this.adminSideBar = new TeamCollaboration.AdminSideBar();
    return $('#sidebar').html(this.adminSideBar.render().el);
  },
  adminView: function() {
    this.renderAdminMain();
    return this.renderAdminSideBar();
  },
  adminProjectManagementView: function() {
    console.log("project management");
    this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain();
    return $('#content').html(this.adminProjectManagementMain.render().el);
  }
});
