//
//  Money.swift
//  MoneyConverter
//
//  Created by 진호놀이터 on 2017. 9. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation

enum Currency:Int {
    case USD = 0,KRW,JPY,EUR
    
    
    var ratio:Double{
    
        get{
        
            switch self {
            case  .USD: return 1.0
            case  .KRW: return 1178.5
            case  .JPY: return 122.45
            case  .EUR: return 0.92
                
            }
        }
    
    }
    
    var symbol:String{
    
        get{
            
            switch self {
            case  .USD: return "$"
            case  .KRW: return "₩"
            case  .JPY: return "¥"
            case  .EUR: return "€"

                
                
            }
        }
    
    }
}

struct Money {
    
    
    var usdollar = 0.0
    init(_ _usdollar:Double){
    
    
        usdollar = _usdollar
    }
    
    
    init( _ amount:Double,currency:Currency){
        
        
        usdollar = amount * currency.ratio
    }
    
    func valueInCurrency(currency:Currency) -> String {
        
        return "\(currency.symbol)" + "\(usdollar * currency.ratio)"
    }
    
}



let myMoney = Money(120)
let incomeInKRW = Money(350000,currency:.KRW)


