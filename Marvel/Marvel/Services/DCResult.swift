//
//  DCResult.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import Foundation
public enum DCResult<T> {
    case success(T)
    case failure(Error)
}
