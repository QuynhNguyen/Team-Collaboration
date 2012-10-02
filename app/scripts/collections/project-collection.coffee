class TeamCollaboration.ProjectCollection extends Backbone.Collection
  model: TeamCollaboration.ProjectModel
  url: "#{GlobalConfig.API.server}:#{GlobalConfig.API.port}/projects"
