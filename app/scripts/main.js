
window.TeamCollaboration = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
		console.log("got here");
    this.router = new TeamCollaboration.Router();
		console.log("done");
		Backbone.history.start();
		console.log("done 2");
  }
};

$(document).ready(function(){
  TeamCollaboration.init();
});
