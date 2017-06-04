//
//  NetworkCallback.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 3..
//  Copyright © 2017년 addcampus. All rights reserved.
//



protocol NetworkCallback {


    func networkResult(resultData : Any, code:String)
    func networkFailed()
}
