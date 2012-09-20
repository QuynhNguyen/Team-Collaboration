TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "frontpageView"
		"admin": "adminView"
		"admin/project-management": "adminProjectManagementView"
		
	initialize: ->
		
		
	## Front Page ##
	
	frontpageView: ->
		this.frontpage = new TeamCollaboration.ApplicationView()
		$('#sidebar').html(this.frontpage.render())
		
	## Admin Page ##
		
	renderAdminMain: ->
		this.adminMain = new TeamCollaboration.AdminMain()
		$('#content').html(this.adminMain.render().el)
		
	renderAdminSideBar: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		$('#sidebar').html(this.adminSideBar.render())
		
	adminView: ->
		this.renderAdminMain()
		this.renderAdminSideBar()
		
	adminProjectManagementView: ->
		this.projectCollection = new TeamCollaboration.ProjectCollection()
		this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain({collection:this.projectCollection})
		this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({collection:this.projectCollection})
		this.projectCollection.fetch()
		$('#content').html(this.adminProjectManagementMain.render().el)
		$('#sidebar').html(this.adminProjectManagementSideBar.render().el)
	
)
