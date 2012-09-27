restify = require('restify')
projectSchema = require('./schema/Project.js')
server = restify.createServer(
  name: "Modern Team Collaboration"
  version: "0.0.1"
)
server.use(restify.acceptParser(server.acceptable))
server.use(restify.queryParser())
server.use(restify.bodyParser())

##Project Management REST API
postProject = (req, res, next) ->
  projectName = req.params.name
  if projectName?
    project = new projectSchema.Project(projectName)
    project.save(res)
  else
    res.status(404)
    res.send({error: "Invalid Params"})
	
getProjectList = (req, res, next) ->	
  project = new projectSchema.Project()
  project.getProjectList(res)
	
getProjectByName = (req, res, next) ->
  projectName = req.params.name
  project = new projectSchema.Project()
  project.getProject(res, projectName)
	
deleteProject = (req, res, next) ->
  projectID = req.params.id
  project = new projectSchema.Project()
  project.deleteProject(res, projectID)
	
updateProject = (req, res, next) ->
  projectID = req.params.id
  projectName = req.params.name
  project = new projectSchema.Project()
  project.updateProject(res, projectID, projectName)
	
server.post('/projects', postProject)
server.get('/projects', getProjectList)
server.get('/projects/:name', getProjectByName)
server.del('/projects/:id', deleteProject)
server.put('/projects/:id', updateProject)

var port = process.env.PORT || 8080;
server.listen(port, -> 
  console.log("listening to server #{server.name}, #{server.url}");
)
