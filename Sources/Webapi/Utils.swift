import Vapor
import Crypto

extension String {

  func encripted() -> String?{
    try? BCrypt.hash("LosslessDataConvertible",cost: 10)
  }
  
}