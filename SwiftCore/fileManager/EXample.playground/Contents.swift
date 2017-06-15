//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)
class json{
//    
//    
//    
 public   func verifyIfSqliteDBExists(){
    print("dss")
//    let url = URL.init(fileURLWithPath:"/Users/jinhos/students.json", isDirectory: true)
//    
//    
//    do {
//        
//        
//        let data = try Data(contentsOf: url)
//        let json = try JSONSerialization.jsonObject(with: data, options: [])
//        if let object = json as? [String: Any] {
//            // json is a dictionary
//            print(object)
//        } else if let object = json as? [Any] {
//            // json is an array
//            print(object)
//        } else {
//            print("JSON is invalid")
//        }
//        
//    } catch {
//        print(error.localizedDescription)
//    }

//    let fileName = "students"
//    
//    let DocumentDirURL = try! FileManager.default.url(for:.documentDirectory, in:.allDomainsMask, appropriateFor: nil, create: true)
//    print(DocumentDirURL)
//    
//  
//    let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("json")
//    print("FilePath: \(fileURL.path)")
//    
//    let writeString = "Write this text to the fileURL as text in iOS using Swift"
//    do {
//        // Write to the file
//        try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//    } catch let error as NSError {
//        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
//    }
    
    let dir = FileManager.default.urls(for: FileManager.SearchPathDirectory.userDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
    let fileurl =  dir.appendingPathComponent("log.txt")
    
    let string = "\(NSDate())\n"
    let data = string.data(using: .utf8, allowLossyConversion: false)!
    
    if FileManager.default.fileExists(atPath: fileurl.path) {
        if let fileHandle = try? FileHandle(forUpdating: fileurl) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
            fileHandle.closeFile()
            
        }
    } else {
        try! data.write(to: fileurl, options: Data.WritingOptions.atomic)
    }
    
    }


}
//
//
//var js = json().readJson()
var js2 = json().verifyIfSqliteDBExists()

//var js = json().verifyIfSqliteDBExists()
