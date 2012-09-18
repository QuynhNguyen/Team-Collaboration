restify = require('restify')
mongoose = require('mongoose')
server = restify.createServer()
db = mongoose.createConnection('localhost', 'mongoose')
db.on('error', console.error.bind(console, 'connection error:'))
db.once('open', ->
  console.log("hell yes")
)
schema = mongoose.Schema({name: 'string'})
Cat = db.model('Cat', schema)
Kitten = db.model('Kitten', schema)

respond = (req, res, next) ->
	res.send("hello #{req.params.name}")
	console.log("test")
	kitty = new Cat({name: 'Nyan'});
	kitten = new Kitten({name: 'wtfman'})
	
	kitten.save((err) ->
		console.log("saved kitten")
	)
	
	kitty.save((err) ->
		if err then console.log("error") else console.log("saved")
	)
	console.log(kitty.name)

###
Kitten.find(function (err, kittens) {
  if (err) /
  console.log(kittens)
})
###


findKitty = (req, res, next) ->
	Cat.find( (err, cats ) -> 
		console.log(cats)
	)
	res.end("end")

server.get('/hello/:name', respond);
server.get('/kitty/', findKitty)

server.listen(8080, -> 
	console.log("listening to server #{server.name}, #{server.url}");
)
