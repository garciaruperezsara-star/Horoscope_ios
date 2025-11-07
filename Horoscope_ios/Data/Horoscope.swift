//
//  Horoscope.swift
//  Horoscope_ios
//
//  Created by Mananas on 6/11/25.
//

import Foundation
import UIKit

struct Horoscope{
    let id: String
    let date: String
    let name: String
    
    func getSignIcon()-> UIImage {
        return UIImage(named:"ic_horoscope/\(id)_icon")!}
    static let horoscopeList = [
        
        Horoscope(id: "aries", date: "March 21 to April 19", name: "Aries"),
        Horoscope(id: "taurus", date: "April 20 to May 20", name: "Taurus"),
        Horoscope(id: "gemini", date: "May 21 to June 20", name: "Gemini"),
        
        Horoscope(id: "cancer", date: "June 21 to July 22", name: "Cancer"),
        Horoscope(id: "leo", date: "July 23 to August 22", name: "Leo"),
        Horoscope(id: "virgo", date: "August 23 to September 22", name: "Virgo"),
        
        Horoscope(id: "libra", date: "September 23 to October 22", name: "Libra"),
        Horoscope(id: "scorpio", date: "October 23 to November 21", name: "Scorpio"),
        Horoscope(id: "sagittarius", date: "November 22 to December 21", name: "Sagittarius"),
        
        Horoscope(id: "capricorn", date: "December 22 to January 19", name: "Capricorn"),
        Horoscope(id: "aquarius", date: "January 20 to February 18", name: "Aquarius"),
        Horoscope(id: "pisces", date: "February 19 to March 20", name: "Pisces")
    ]
    
    
    static func getAll()-> [Horoscope] {
        return horoscopeList}
    
   static func getById(_ id: String)->Horoscope{
       return getAll().first(where: { $0.id == id })!
    }
}
