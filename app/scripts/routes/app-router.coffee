TeamCollaboration.Router = Backbone.Router.extend(
	
  routes:
    "": "renderFrontpageView"
    "admin": "renderAdminView"
    "admin/project-management": "renderProjectManagementView"
    "login/:accessToken/:state": "doAuthentication"
  
  initialize: ->
    ## Global Authentication View ##
    this.user = new TeamCollaboration.UserModel();
    this.loginView = new TeamCollaboration.LoginView({model:this.user})
    this.loginView.render()
    AuthenticationHelper.doAuthentication(this.user)
    
	## Global Method ##
  createProjectManagementSideBar: ->
    if this.projectManagementSideBar is undefined
      this.projectCollection = new TeamCollaboration.ProjectCollection()
      this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({collection:this.projectCollection})
      this.ProjectManagementSideBar.render()
      this.projectCollection.fetch()
  
  doAuthentication: (accessToken, state) ->
    console.log(decodeURIComponent(state))
    @navigate(decodeURIComponent(state))
			
		
	## Front Page ##
  renderFrontpageView: ->
    console.log(this.user)
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
