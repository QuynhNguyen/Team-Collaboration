TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "frontpageView"
		"admin": "adminView"
		"admin/project-management": "adminProjectManagementView"
		
	initialize: ->
		this.projectCollection = new TeamCollaboration.ProjectCollection()
		
	## Front Page ##
	frontpageView: ->
		this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({collection:this.projectCollection})
		this.adminProjectManagementSideBar.render()
		this.projectCollection.fetchIfEmpty()
		
		
	## Admin Page ##
	adminView: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		this.adminMain = new TeamCollaboration.AdminMain()
		this.adminMain.render()
		this.adminSideBar.render()
		
	adminProjectManagementView: ->
		this.adminProjectManagementMain = new TeamCollaboration.AdminProjectManagementMain({collection:this.projectCollection})
		this.adminProjectManagementSideBar = new TeamCollaboration.AdminProjectListView({collection:this.projectCollection})
		this.projectCollection.fetchIfEmpty()
		this.adminProjectManagementMain.render()
		this.adminProjectManagementSideBar.render()	
	
)
