import Vapor
func routes(_ router: inout Router){
  UserController().configure(router)
}