//
//  Channel.swift
//  Smack
//
//  Created by Ryan Flores on 3/23/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import Foundation

struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
