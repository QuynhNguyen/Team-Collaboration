TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "frontpageView"
		"admin": "adminView"
		"admin/project-management": "adminProjectManagementView"
		
	initialize: ->
		
		
	## Front Page ##
	
	frontpageView: ->
		this.projectCollection = new TeamCollaboration.ProjectCollection()
		this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({collection:this.projectCollection})
		this.projectCollection.fetch()
		this.adminProjectManagementSideBar.render()
		
		
	## Admin Page ##
		
	renderAdminMain: ->
		this.adminMain = new TeamCollaboration.AdminMain()
		this.adminMain.render()
		
	renderAdminSideBar: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		this.adminSideBar.render()
		
	adminView: ->
		this.renderAdminMain()
		this.renderAdminSideBar()
		
	adminProjectManagementView: ->
		this.projectCollection = new TeamCollaboration.ProjectCollection()
		this.adminProjectManagementMain.close() if this.adminProjectManagementMain
		this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain({collection:this.projectCollection})
		this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({collection:this.projectCollection})
		this.projectCollection.fetch()
		this.adminProjectManagementMain.render()
		this.adminProjectManagementSideBar.render()
	
)
