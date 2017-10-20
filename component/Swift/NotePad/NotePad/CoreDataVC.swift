//
//  CoreDataVC.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import CoreData
class CoreDB {
    var appDelegate: AppDelegate {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        return delegate
    }
    
    var  context: NSManagedObjectContext {
        let ctx = appDelegate.persistentContainer.viewContext
        
        return ctx
    }
    var fetchRequest : NSFetchRequest<Note> =  {
        
        let fetch: NSFetchRequest<Note> = Note.fetchRequest()
        return fetch
    }()
    
    func insertNewData(entityName entity: String) -> Any {
    
        let mangeObject = NSEntityDescription.insertNewObject(forEntityName:entity, into:context)
        return mangeObject 
    }
    
    func deleteData(data:Note){
        
        context.delete(data)
        
    }
  func  saveCoreDB(){
    
        do{
            
            try context.save()
        } catch{
            
            print("에러")
        }
    }
}

class CoreDataVC: UIViewController {

     let coreDelegate = CoreDB()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

  
}
