//
//  Registration.swift
//  Hotel
//
//  Created by Сергей Иванов on 03/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import Foundation

struct Regictration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wiFi: Bool
    
    var roomType: RoomType
    
    init(
        firstName: String = String(),
        lastName: String = String(),
        emailAddress: String = String(),
        checkInDate: Date = Date(),
        checkOutDate: Date = Date(),
        numberOfAdults: Int = Int(),
        numberOfChildren: Int = Int(),
        wiFi: Bool = Bool(),
        roomType: RoomType = RoomType(
            id: Int(),
            name: String(),
            shortName: String(),
            price: Int()
            )
         ) {
            self.firstName = firstName
            self.lastName = lastName
            self.emailAddress = emailAddress
            self.checkInDate = checkInDate
            self.checkOutDate = checkOutDate
            self.numberOfAdults = numberOfAdults
            self.numberOfChildren = numberOfChildren
            self.wiFi = wiFi
            self.roomType = roomType
    }
}


