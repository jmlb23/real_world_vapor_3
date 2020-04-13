import Vapor
import Crypto

extension String {

  func encripted() -> String?{
    try? BCrypt.hash(self,cost: 10)
  }

}