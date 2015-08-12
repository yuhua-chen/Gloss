//
//  Gloss.swift
//  Gloss
//
// Copyright (c) 2015 Harlan Kellaway
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

public typealias JSON = [String : AnyObject]

public protocol Decodable {
    
    /**
    Designated initializer to create new object
    from JSON representation
    
    - parameter json: JSON representation of object
    */
    init(json: JSON)
    
}

public protocol Encodable {
    
    /**
    Array of encoded values as JSON
    */
    func encoders() -> [JSON?]
}

public class Glossy: Decodable, Encodable {
    
    public required init(json: JSON) { }
    
    public func toJSON() -> JSON {
        return Gloss.toJSON(self)
    }
    
    public func encoders() -> [JSON?] {
        
        return []
        
    }
    
}

struct Gloss {
    
    /**
    JSON representation of model
    */
    internal static func toJSON<T: Encodable>(model: T) -> JSON {
        var json: JSON = [:]
        
        for encoder in model.encoders() {
            if let encoder = encoder {
                json.add(encoder)
            }
        }
        
        return json
    }
    
}
