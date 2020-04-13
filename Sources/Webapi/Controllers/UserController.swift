import Vapor
import FluentSQLite

final class UserController {

  func configure(_ router: Router){
    router.post("/users/login", use: login)
    router.post("/users", use: register)
  }

  func login(_ req: Request) -> Future<User> {
    let connection = req.databaseConnection(to: .sqlite)
    let login = try? req.content.decode(Login.self)
    let repo = try? req.sharedContainer.make(Repository<UserE,SQLiteDatabase,DatabaseConnectable>.self)

    return connection.flatMap({cnn in login!.flatMap({log in 
      return repo!.get({x in x.username == log.username && x.password == log.password}, cnn).map({x in
      switch(x){
        case .some(let x):
          return User(email: x.email, token: "String", username: x.username)
        case .none:
          throw Abort(.unauthorized, reason: "User or password incorrect")
      }
     
     
     })}) })
  }

  func register(_ req: Request) throws -> Future<String> { 
    let connection = req.databaseConnection(to: .sqlite)
    let reg = try? req.content.decode(Register.self)
    let dependency = try? req.sharedContainer.make(Repository<UserE,SQLiteDatabase,DatabaseConnectable>.self)
    
    if let request = reg, let repo = dependency{
      let user = request.map({lo in UserE.init(id: UUID(), username: lo.username, password: lo.password.encripted()!, email: lo.email, bio: nil, image: nil)})
      return connection.flatMap({cnn in user.flatMap({user in repo.add(user, cnn).map({x in x.description})})})

    }else{
      throw Abort(.internalServerError, reason: "Internal Error")
    }

    
  }

  func getCurrent(_ req: Request) -> Future<User> { 
    fatalError("Todo implement")
    
  }

  func updateUser(_ req: Request) -> Future<User> {
    fatalError("Todo implement")

  }

}