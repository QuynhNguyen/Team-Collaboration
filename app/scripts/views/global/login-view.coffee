TeamCollaboration.LoginView = Backbone.View.extend(

  events: 
    "click #logout": "logout"

  el: $('#authentication')
    
  login_template: _.template($('#tpl-login-btn').html())
  welcome_template: _.template($('#tpl-welcome-user').html())
  
  initialize: ->
    self = this
    this.model.on(
      'url:changed',
      ->
        self.model.fetch(
          error: (model, response) ->
            console.log("Fail to fetch #{model} due to #{response}")
          success: (model, response) ->
            self.render()
        )
    )
    
  logout: ->
    AuthenticationHelper.deleteCookie("accessToken")
    window.location = "/"
    
  renderLogin: ->
    this.$el.html(this.login_template())
    AuthenticationHelper.createLoginLink()
    
  renderWelcome: ->
    console.log(this.model)
    this.$el.html(this.welcome_template(this.model.toJSON()))
    
  fetchUserInfo: (e) ->
    console.log("chaning")
    self = this
    this.model.fetch(
      error: (model, response) ->
        console.log("Fail to fetch #{model} due to #{response}")
      success: (model, response) ->
        self.render()
    )
  
  render: ->
    if this.model.hasValidAccessToken()
      @renderWelcome()
    else
      @renderLogin()
)