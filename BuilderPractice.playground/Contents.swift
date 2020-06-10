import UIKit

class CodeBuilder: CustomStringConvertible {
    let className: String
    var varName = [String]()
    var varType = [String]()
    
    init(_ className: String) {
        self.className = className
    }
    
    func addField(_ name: String, _ type: String) -> CodeBuilder{
        varName.append(name)
        varType.append(type)
        return self
    }
    
    public var description: String {
        return "public class \(self.className)"
    }
}

let code = CodeBuilder("person").addField("age", "int")
print(code)
