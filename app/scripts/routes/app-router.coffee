TeamCollaboration.Router = Backbone.Router.extend(
	
	routes:
		"": "renderFrontpageView"
		"admin": "renderAdminView"
		"admin/project-management": "renderProjectManagementView"

	
	## Global Method ##
	createProjectManagementSideBar: ->
		if this.projectManagementSideBar is undefined
			this.projectCollection = new TeamCollaboration.ProjectCollection()
			this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({collection:this.projectCollection})
			this.ProjectManagementSideBar.render()
			this.projectCollection.fetch()
			
		
	## Front Page ##
	renderFrontpageView: ->
		this.createProjectManagementSideBar()

	## Admin Page ##
	renderAdminView: ->
		this.adminSideBar = new TeamCollaboration.AdminSideBar()
		this.adminMain = new TeamCollaboration.AdminMain()
		this.adminMain.render()
		this.adminSideBar.render()
		
	renderProjectManagementView: ->
		this.createProjectManagementSideBar()
		this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({collection:this.projectCollection})
		this.projectManagementMain.render()

)
