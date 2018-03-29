//
//  MessageService.swift
//  Smack
//
//  Created by Ryan Flores on 3/23/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()

    var channels = [Channel]()
    var message = [Messages]()
    var selectedChannel : Channel?
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in

            if response.result.error == nil {
                guard let data = response.data else { return }

/*                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                } catch let error {
//                    debugPrint(error as Any)
//                }
//                print(self.channels)
*/

               do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                        completion(true)                    }
                } catch {
                    print("")
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func clearMessages() {
        message.removeAll()
    }

    func findAllMessagesForChannel(channelID : String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_GET_ALL_MESSAGES)\(channelID)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                self.clearMessages()
                do {
                    if let json = try JSON(data : data).array {
                        for item in json {
                            
                            let messageBody = item["messageBody"].stringValue
                            let channelID = item["channelId"].stringValue
                            let id = item["_id"].stringValue
                            let userName = item["userNae"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            
                            let message = Messages(id: id, messageBody: messageBody, channelID: channelID, userName: userName, userAvatar: userAvatar, userAvatarColor: userAvatarColor, timeStamp: timeStamp)
                            
                            self.message.append(message)
                        }
                    }
                    completion(true)
                } catch {
                    print("")
                }
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    
}




