import FluentSQLite

class UserRepository: Repository<UserE,SQLiteDatabase,DatabaseConnectable>{
  let db: SQLiteDatabase
  override init(_ db: SQLiteDatabase){
    self.db = db
    super.init(db)
  }
  override func add(_ t: UserE,_ cnn: DatabaseConnectable) -> EventLoopFuture<Bool> { 
    t.save(on: cnn).map({ x in  
      print(x)
    return true })
  }
  override func remove(_ t: UserE,_ cnn: DatabaseConnectable) -> EventLoopFuture<Bool>{ 
    t.delete(on: cnn).map({x in true})
  }
  override func filter(_ pred: @escaping (UserE) -> Bool,_ cnn: DatabaseConnectable) -> EventLoopFuture<[UserE]>{ 
    UserE.query(on: cnn).all().map({ x in x.filter(pred)})
  }
  override func get(_ t: @escaping (UserE) -> Bool,_ cnn: DatabaseConnectable) -> EventLoopFuture<UserE?>{ 
    UserE.query(on: cnn).all().map({ x in x.first(where: t)})
  }
  override func replace(_ new: UserE,_ cnn: DatabaseConnectable) -> EventLoopFuture<Bool>{
    new.update(on: cnn).map({x in true })
  }
  override func toArray(_ cnn: DatabaseConnectable) -> EventLoopFuture<[UserE]>{ 
    UserE.query(on: cnn).all()
  }
}