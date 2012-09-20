
TeamCollaboration.ApplicationView = Backbone.View.extend({
  template: _.template($('#tpl-frontpage-sidebar').html()),
  render: function(e) {
    return this.template();
  }
});
