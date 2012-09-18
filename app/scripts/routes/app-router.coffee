TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"admin": "renderAdminMain"
		
	renderAdminMain: ->
		console.log("got into admin")
		this.adminMain = new TeamCollaboration.AdminMain()
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		$('#content').html(this.adminMain.render().el)
		$('#sidebar').html(this.adminSideBar.render().el)
	
)
