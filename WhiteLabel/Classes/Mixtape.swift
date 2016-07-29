//
//  Mixtape.swift
//
//  Created by Alex Givens http://alexgivens.com on 1/13/16
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

import SwiftyJSON

public class Mixtape: Equatable {
    
    public var coverLarge : String!
    public var name : String!
    public var id : Int!
    public var coverArtistName : String!
    public var coverArtistURL : String!
    public var sponsorDescription : String!
    public var sponsorURL : String!
    public var releaseDate : String!
    public var playlistNumber : Int!
    public var trackCount : Int!
    public var tracks = [Track]()
    
    public init(fromJson json: JSON!){
        if json == nil { return }
        
        coverLarge = json["cover_large"].stringValue
        name = json["name"].stringValue
        id = json["id"].intValue
        coverArtistName = json["cover_description"].stringValue
        coverArtistURL = json["cover_url"].stringValue
        sponsorDescription = json["sponsor_description"].stringValue
        sponsorURL = json["sponsor_description"].stringValue
        releaseDate = json["release_date"].stringValue
        playlistNumber = json["playlist_number"].intValue
        trackCount = json["track_count"].intValue
    }
}

public func ==(lhs: Mixtape, rhs: Mixtape) -> Bool {
    return lhs.id == rhs.id
}