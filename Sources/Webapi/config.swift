import FluentSQLite
import SQLite
import Vapor
func config(_ services: inout Services){
  try! services.register(FluentSQLiteProvider())
  var databases = DatabasesConfig()
  let sqlite = try! SQLiteDatabase(storage: .memory)
  databases.add(database: sqlite, as: .sqlite)

  services.register(databases)
  services.register(EngineRouter.default(), as: Router.self)
  services.register(Repository<UserE,SQLiteDatabase,DatabaseConnectable>.self){x in UserRepository(sqlite)}
  var migrations = MigrationConfig()
  migrations.add(model: UserE.self, database: .sqlite)
  services.register(migrations)

    
}