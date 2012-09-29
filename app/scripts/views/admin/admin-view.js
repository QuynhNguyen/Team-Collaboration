var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

TeamCollaboration.AdminMain = (function(_super) {

  __extends(AdminMain, _super);

  function AdminMain() {
    return AdminMain.__super__.constructor.apply(this, arguments);
  }

  AdminMain.prototype.el = $('#content');

  AdminMain.prototype.template = _.template($('#tpl-admin-main').html());

  AdminMain.prototype.initialize = function() {
    return DOMHelper.clearElement(this.el);
  };

  AdminMain.prototype.render = function(e) {
    return this.$el.html(this.template());
  };

  return AdminMain;

})(Backbone.View);

TeamCollaboration.AdminSideBar = (function(_super) {

  __extends(AdminSideBar, _super);

  function AdminSideBar() {
    return AdminSideBar.__super__.constructor.apply(this, arguments);
  }

  AdminSideBar.prototype.el = $('#sidebar');

  AdminSideBar.prototype.template = _.template($('#tpl-admin-sidebar').html());

  AdminSideBar.prototype.initialize = function() {
    return DOMHelper.clearElement(this.el);
  };

  AdminSideBar.prototype.render = function(e) {
    return this.$el.html(this.template());
  };

  return AdminSideBar;

})(Backbone.View);
