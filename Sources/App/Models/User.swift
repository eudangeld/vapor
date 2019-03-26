import FluentSQLite
import Vapor

final class User:SQLiteModel{
    var id:Int?
    var userName:String;
    
    init(id:Int? = nil , userName:String){
        self.id = id
        self.userName = userName
    }
}

extension User: Content{}
extension User: Migration{}
