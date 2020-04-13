import FluentSQLite
struct UserE : Model, Migration{
    typealias Database = SQLiteDatabase
    typealias ID = UUID
    public static var idKey: IDKey = \UserE.id
    var id: UUID?
    var username: String
    var password: String
    var email: String
    var bio: String?
    var image: String?

}