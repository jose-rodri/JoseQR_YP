//
//  MovieNetwork.swift
//  Reto_Tecnico_Jose_QR
//
//  Created by Jose Leoncio Quispe Rodriguez on 5/05/22.
//



import Foundation

enum UserService: ServiceEnum {
    case UserList
}

struct UserNetworkFactory: Networking {

    typealias EnumType = UserService
    static func getService(from type: EnumType) -> Requestable {
        switch type {
     
        case .UserList:
            return MovieNetwork()
       
        }
    }
}

extension UserNetworkFactory {
    
    private struct MovieNetwork: Requestable {
        var method: HTTPMethod = .get
        var path: String =  Constant.Endpoint.listUser
        var parameters: [String: Any] = [:]

    }

}
