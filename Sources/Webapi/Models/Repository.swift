import NIO
import Vapor

class Repository<T,DS,CNN>: Service{

  init(_ db: DS){

  }

  func add(_ t: T,_ cnn: CNN) -> EventLoopFuture<Bool>{
    fatalError("Abs")
  }
  func remove(_ t: T,_ cnn: CNN) -> EventLoopFuture<Bool>{
    fatalError("Abs")
  }
  func filter(_ pred: @escaping (T) -> Bool,_ cnn: CNN) -> EventLoopFuture<[T]>{
    fatalError("Abs")
  }
  func get(_ t: @escaping (T) -> Bool,_ cnn: CNN) -> EventLoopFuture<T?>{
    fatalError("Abs")
  }
  func replace(_ new: T,_ cnn: CNN) -> EventLoopFuture<Bool>{
    fatalError("Abs")
  }
  func toArray(_ cnn: CNN) -> EventLoopFuture<[T]>{
    fatalError("Abs")
  }
}

