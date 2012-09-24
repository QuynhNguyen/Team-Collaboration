
TeamCollaboration.AdminMain = Backbone.View.extend({
  el: $('#content'),
  template: _.template($('#tpl-admin-main').html()),
  initialize: function() {
    return DOMHelper.clearElement(this.el);
  },
  render: function(e) {
    return this.$el.html(this.template());
  }
});

TeamCollaboration.AdminSideBar = Backbone.View.extend({
  el: $('#sidebar'),
  template: _.template($('#tpl-admin-sidebar').html()),
  initialize: function() {
    return DOMHelper.clearElement(this.el);
  },
  render: function(e) {
    return this.$el.html(this.template());
  }
});
