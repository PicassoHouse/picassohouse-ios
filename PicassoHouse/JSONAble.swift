//
//  JSONAble.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

protocol JSONAbleType {
    static func fromJSON(_: [String: Any]) -> Self?
}
