//
//  APIComic.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON
class APIComic {
    private let urlBuilder = URLBuilder()
    private let configuration = DCConfiguration()
    static let shared = APIComic()
    
    private init() { }
    private  func fetchComics<T>(json :JSON,completion: @escaping (DCResult<[T]>)->()){
        let data = json["data"]["results"].array
        var comics = [Comic]()
        data?.forEach({ (jsonComic) in
            comics.append(Comic(json: jsonComic))
        })
        guard let result  = DCResult.success(comics) as? DCResult<[T]> else {return}
        completion(result)
    }
    public func getComics(completion: @escaping (DCResult<[Comic]>)->()) {
        request(completion: completion)
    }
    private func request <T> (completion: @escaping (DCResult<[T]>) -> ()){
        guard let url = urlBuilder.applicationURL(with: configuration) else {return}
        guard let parameter = urlBuilder.getParameters(with: configuration) else {return}
        Alamofire.request(url, method: .get, parameters: parameter).validate().responseJSON { (response) in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                self.fetchComics( json: json, completion: completion)
            case .failure(let error):
                completion(DCResult.failure(error))
            }
        }
    }
}
