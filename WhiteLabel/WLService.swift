//
//  WLService.swift
//
//  Created by Alex Givens http://alexgivens.com on 7/1/16
//  Copyright © 2016 Noon Pacific LLC http://noonpacific.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


public struct WLService: Equatable {
    
    public var id : Int!
    public var name : String!
    public var slug : String!
    public var externalURL : URL?
    
    public init?(response: HTTPURLResponse, representation: Any) {
        
        guard let representation = representation as? [String: Any] else {
            return nil
        }
        
        id = representation["id"] as! Int
        name = representation["name"] as! String
        slug = representation["slug"] as! String
        if let externalURLString = representation["external_url"] as? String {
            externalURL = URL(string: externalURLString)
        }
    }
    
}

public func ==(lhs: WLService, rhs: WLService) -> Bool {
    return lhs.id == rhs.id
}
