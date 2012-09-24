
window.TeamCollaboration = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    this.Routers.router = new TeamCollaboration.Router();
		Backbone.history.start();
  }
};

$(document).ready(function(){
  TeamCollaboration.init();
});
