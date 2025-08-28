//
//  Regester.swift
//  ComplexInputScreen
//
//  Created by Student on 27/08/25.
//

import Foundation


struct Regestration
{
    var firstname : String
    var lastname : String
    var emailAddress : String
    
    var checkInDate : Date
    var checkOutDate : Date
    var numberOfAdults : Int
    var numberOfChildren : Int
    
    var wifi : Bool
    var roomType : RoomType
}


struct RoomType : Equatable
{
    var id : Int
    var name : String
    var shortName : String
    var price : Int
    
    static func ==(lhs : RoomType , rhs : RoomType)-> Bool
    {
        return lhs.id == rhs.id
    }
}

var all : [RoomType] =
    [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
    RoomType(id: 1, name: "One King", shortName: "K", price: 209),
    RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]

