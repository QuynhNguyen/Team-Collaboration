TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "frontpageView"
		"admin": "adminView"
		"admin/project-management": "adminProjectManagementView"
		
	initialize: ->
		this.projectCollection = new TeamCollaboration.ProjectCollection()
	
	## Global Method ##
	createProjectManagementSideBar: ->
		if this.projectManagementSideBar is undefined
			this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({collection:this.projectCollection})
			this.ProjectManagementSideBar.render()
			this.projectCollection.fetchIfEmpty()
		
	## Front Page ##
	frontpageView: ->
		this.createProjectManagementSideBar()
		
		
	## Admin Page ##
	adminView: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		this.adminMain = new TeamCollaboration.AdminMain()
		this.adminMain.render()
		this.adminSideBar.render()
		
	adminProjectManagementView: ->
		this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({collection:this.projectCollection})
		this.projectManagementMain.render()
		this.createProjectManagementSideBar()
	
)
