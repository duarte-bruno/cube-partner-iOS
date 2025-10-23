import Foundation

extension String {
    
    func toObject<T: Decodable>() -> T? {
        let decoder = JSONDecoder()
        
        do {
            guard let data = try? JSONEncoder().encode(self) else {
                throw NSError(domain: "", code: 0, userInfo: nil)
            }
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
            return nil
        }
    }

    func onlyDigits() -> String { 
        filter(\.isNumber) 
    }
    
    func wholeMatch(of pattern: String) -> Bool {
        range(of: pattern, options: [.regularExpression, .anchored]) != nil
    }    
}

