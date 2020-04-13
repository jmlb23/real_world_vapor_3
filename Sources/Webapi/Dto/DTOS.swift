import Vapor
struct Login : Content{
  let username: String
  let password: String
}

struct User : Content{
  let email: String
  let token: String
  let username: String
}

struct Register : Content{
  let email: String
  let password: String
  let username: String
}