TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "frontpageView"
		"admin": "adminView"
		"admin/project-management": "adminProjectManagementView"
		
	initialize: ->
		
	## Front Page ##
	
	frontpageView: ->
		this.frontpage = new TeamCollaboration.ApplicationView()
		$('#sidebar').html(this.frontpage.render().el)
		
	## Admin Page ##
		
	renderAdminMain: ->
		this.adminMain = new TeamCollaboration.AdminMain()
		$('#content').html(this.adminMain.render().el)
		
	renderAdminSideBar: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		$('#sidebar').html(this.adminSideBar.render().el)
		
	adminView: ->
		this.renderAdminMain()
		this.renderAdminSideBar()
		
	adminProjectManagementView: ->
		console.log("project management")
		this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain()
		$('#content').html(this.adminProjectManagementMain.render().el)
	
)
