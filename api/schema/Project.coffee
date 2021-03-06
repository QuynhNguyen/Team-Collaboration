mongoose = require('mongoose')
connection = require('../utils/DBConnection.js')

class Project 
  constructor: (@name, @project, @Project, @db) ->
    @db = connection.createMongoDBConnection()
    schema = mongoose.Schema({name:{type:'string', required: true}})
    @Project = @db.model("Project", schema)
    projectName = @name
    @project = new @Project({name: projectName})
		
		
  save: (res) =>
    @Project.find({name:@name}).exec( (err, projectFound) =>
      if projectFound.length > 0
        res.contentType ='json'
        res.send(404, {error: "#{@name} is already existed."})
        @db.close()
      else
        @project.save (err, proj) =>
          if err   
            res.contentType = 'json'
            res.send(404, {error: 'project name must be unique and not empty'})
          else 
            console.log("saved project")
            res.contentType = 'json'
            res.send(
            	proj
            )
          @db.close()
    )

				
  getProjectList: (res) =>
    @Project.find().sort('field name').exec (err, projects) =>
      res.contentType = 'json'
      res.send(200, projects)
      @db.close()
			
			
  getProject: (res, projectName) =>
    @Project.find({name:projectName}).exec( (err, project) =>
      if project.length <= 0
        res.send(404, {error: "No Project Found Under The Name Of #{projectName}"})
      else
        res.contentType = 'json'
        res.send(200, project)		
      @db.close()
    )
		
  deleteProject: (res, projectID) =>
    @Project.findByIdAndRemove(projectID, =>
      res.contentType = 'json'
      res.send(200, {success: "Delete Project Request Executed"})
      @db.close()
    )
		
  updateProject: (res, projectID, projectName) =>
    @Project.find({name:projectName}).exec( 
      (err, projectCollection) =>
        if projectCollection.length > 0
          res.send(404, {error: "#{projectName} is already existed"})
          @db.close()
        else
          @Project.findById(
            projectID
            (err, proj) =>
              proj.name = projectName
              proj.save( => 
                res.contentType = 'json'
                res.send(200, {success: "Project has been updated"})
                @db.close()
              )
          )
    )

module.exports.Project = Project