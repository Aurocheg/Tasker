//
//  Board.swift
//  Tasker
//
//  Created by Aurocheg on 10.11.22.
//

import Foundation

protocol BoardProtocol {
    var image: String { get set }
    var title: String { get set }
    var text: String { get set }
}

struct Board: BoardProtocol {
    var image: String
    var title: String
    var text: String
    
    static func getBoards() -> [Board] {
        return [
            Board(image: "onboardingOne",
                  title: "Lorem Ipsum is simply dummy text?",
                  text: "Welcome !!! Do you want to clear task super fast with Mane?"),
            Board(image: "onboardingTwo",
                  title: "Lorem Ipsum is simply dummy text?",
                  text: "Easily arrange work order for you to mange. Many functions to choose."),
            Board(image: "onboardingThree",
                  title: "Lorem Ipsum is simply dummy text?",
                  text: "It has been easier to complete tasks. Get started with us!")
        ]
    }
}
