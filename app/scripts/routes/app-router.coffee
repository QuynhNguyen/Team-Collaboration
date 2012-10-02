class TeamCollaboration.Router extends Backbone.Router
	
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
  createProjectManagementSideBar: (path) ->
    if this.projectManagementSideBar is undefined
      this.projectCollection = new TeamCollaboration.ProjectCollection()
      this.ProjectManagementSideBar = new TeamCollaboration.ProjectListView({collection:this.projectCollection, path:path})
      this.ProjectManagementSideBar.render()
      this.projectCollection.fetch()
  
  doAuthentication: (accessToken, state) ->
    console.log(decodeURIComponent(state))
    @navigate(decodeURIComponent(state))
			
		
	## Front Page ##
  renderFrontpageView:  ->
    this.createProjectManagementSideBar(Backbone.history.fragment)

	## Admin Page ##
  renderAdminView: ->
    this.adminSideBar = new TeamCollaboration.AdminSideBar()
    this.adminMain = new TeamCollaboration.AdminMain()
    this.adminMain.render()
    this.adminSideBar.render()
		
  renderProjectManagementView: ->
    this.createProjectManagementSideBar(Backbone.history.fragment)
    this.projectManagementMain = new TeamCollaboration.ProjectManagementMain({collection:this.projectCollection})
    this.projectManagementMain.render()

