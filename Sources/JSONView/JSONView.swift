//
//  JSONView.swift
//  JSONView
//
//  Created by Quentin Fasquel on 16/04/2020.
//

import SwiftUI

public typealias JSON = [String: AnyHashable]

public struct JSONView: View {
    private let json: JSON

    public init(_ json: JSON) {
        self.json = json
    }

    public init(url: URL) {
        do {
            let data = try Data(contentsOf: url)
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            self.json = (jsonData as? JSON) ?? JSON()
        } catch {
            self.json = JSON()
            print("JSONView error: \(error.localizedDescription)")
        }
    }

    public var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            JSONTreeView(json)
                .padding([.top, .bottom], 10)
                .padding(.trailing, 10)
        }
    }
}
