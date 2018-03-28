//
//  SocketService.swift
//  Smack
//
//  Created by Ryan Flores on 3/27/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init () {
        super.init()
    }
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    lazy var socket: SocketIOClient = manager.defaultSocket
 
    
    func establishConnection() {
        let socket = self.manager.defaultSocket
        socket.connect()
    }
    
    func closeConnection() {
        let socket = self.manager.defaultSocket
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        let socket = self.manager.defaultSocket
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreate") { (dataArray, ack) in

            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelID = dataArray[2] as? String else { return }


            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelID)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
}

