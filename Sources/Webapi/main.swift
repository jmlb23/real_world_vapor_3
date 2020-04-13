import Vapor
import FluentSQLite
import JWT

var services = Services.default()
config(&services)
var app = try Application(config: Config.default(), environment: Environment.development, services: services)
var router = try app.make(Router.self)
routes(&router)

try app.run()