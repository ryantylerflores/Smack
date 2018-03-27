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
                           //print(self.channels[0].channelTitle)
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

//    func createChannel(name: String!, description: String!, completion: @escaping CompletionHandler) {
//        
//        let body: [String : Any] = [
//            "name" : name,
//            "description" : description
//        ]
//        
//        Alamofire.request(URL_CREATE_CHANNELS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
//            
//            if response.result.error == nil {
//                guard let data = response.data else { return }
//                
//                do {
//                    
//                }
//            }
//        }
//        
//    }

}




