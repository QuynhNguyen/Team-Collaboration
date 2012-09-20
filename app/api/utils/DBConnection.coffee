mongoose = require('mongoose')
##Creating DatabaseConnection

exports.createMongoDBConnection = ->
	db = mongoose.createConnection('localhost', 'TeamCollaboration')
	db.on('error', console.error.bind(console, 'connection error:'))
	db.once('open', ->
	  console.log("Connection Establish")
	)
	return db
