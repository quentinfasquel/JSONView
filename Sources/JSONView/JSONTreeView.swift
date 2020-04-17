//
//  JSONTreeView.swift
//  Example
//
//  Created by Quentin Fasquel on 16/04/2020.
//

import SwiftUI

public struct JSONTreeView: View {
    private let keyValues: [(key: String, value: AnyHashable)]

    public init(_ json: JSON) {
        self.keyValues = json.sorted { $0.key < $1.key }
    }

    public init(_ source: [(key: String, value: AnyHashable)]) {
        self.keyValues = source
    }
    
    public var body: some View {
        ForEach(keyValues.indices, id: \.self) { index in
            VStack(alignment: .leading) {
                if index > 0 {
                    Divider()
                }

                JSONCell(self.keyValues[index])
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
}
