//
//  PersonDataModel.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 5. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation


let koreanWord: String = "koreanWord"
let englishWord: String = "englishWord"

struct SoptPerson {
    
    var name: String
    var university: String
    var soptPart: Dictionary<String, String>
    

}


class PersonDataModel {
    
    static let sharedData = PersonDataModel()
    var registeredPersons :Array<SoptPerson>
    init() {
       Utility().myLog(object: "공유생성")
        
        registeredPersons = Array()
    }
    
//    func addInPersonDataModel(person: SoptPerson) {
//        
//        Utility().myLog(object: person.name)
//       self.registeredPersons .insert(person, at:registeredPersons.count)
//        
//         Utility().myLog(object: registeredPersons.count)
//        
//    }
    
    func addInPersonDataModel(inputName: String, inPutUniversity: String, inputSoptPart: String) {
        
        let inPutEnglishWord: String = changingWordForPart(koreanWord: inputSoptPart)
        
        let  person: SoptPerson = SoptPerson(name: inputName, university: inPutUniversity, soptPart: [koreanWord: inputSoptPart,englishWord:inPutEnglishWord])
         self.registeredPersons .insert(person, at:registeredPersons.count)
        
        Utility().myLog(object: registeredPersons.count)
        
    }
    func deleteInPersonDataModel(index: Int) -> SoptPerson {
        
        let deleteIndex =  self.registeredPersons.remove(at: index)

        return deleteIndex
    }
    
    func changingWordForPart(koreanWord: String) -> String {
        
        var englishWord: String?
        
        switch koreanWord {
        case "개발":
                englishWord = "develop"
                break
        case "디자인":
            englishWord = "design"
            break
        case "기획":
            englishWord = "plan"
            break
        default:
            break
        }
        return englishWord!
    }
    
    
    
    // 추후 두 인덱스 교환하는 코드 추가 
    
}


