//
//  JSONCell.swift
//  JSONView
//
//  Created by Quentin Fasquel on 16/04/2020.
//

import SwiftUI

public struct JSONCell: View {
    private let key: String
    private let rawValue: AnyHashable

    @State private var isOpen: Bool = false
    @State private var isRotate: Bool = false

    internal init(_ keyValue: (key: String, value: AnyHashable)) {
        self.init(key: keyValue.key, value: keyValue.value)
    }

    public init(key: String, value: AnyHashable) {
        self.key = key
        self.rawValue = value
    }

    private func specificView() -> some View {
        switch rawValue {
        case let array as [AnyHashable]:
            return AnyView(keyValueView(treeView: arrayView(array)))
        case let dictionary as JSON:
            return AnyView(keyValueView(treeView: treeView(dictionary)))
        case let number as NSNumber:
            return AnyView(leafView(number.stringValue))
        case let string as String:
            return AnyView(leafView(string))
        default:
            fatalError()
        }
    }
    
    public func copyValue() {
        switch rawValue {
        case let number as NSNumber:
            UIPasteboard.general.string = number.stringValue
        case let string as String:
            UIPasteboard.general.string = string
        default:
            break
        }
    }
    
    public var body: some View {
        specificView().padding(.leading, 10).contextMenu {
            Button(action: copyValue) {
                Text("Copy Value")
            }
        }
    }
    
    private func arrayView(_ arrayValue: [AnyHashable]) -> JSONTreeView {
        JSONTreeView(arrayValue.enumerated().map {
            (key: "\(key)[\($0.offset)]", value: $0.element)
        })
    }

    private func leafView(_ stringValue: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center) {
                Text(key)
                Spacer()
            }

            Text(stringValue.prefix(60))
                .lineSpacing(0)
                .foregroundColor(Color.gray)
        }
            .padding(.vertical, 5)
            .padding(.trailing, 10)
    }
    
    private func treeView(_ dictionaryValue: JSON) -> JSONTreeView {
        JSONTreeView(dictionaryValue)
    }

    private func toggle() {
        self.isOpen.toggle()
        withAnimation(.linear(duration: 0.1)) {
            self.isRotate.toggle()
        }
    }
    
    private func keyValueView(treeView valueView: JSONTreeView) -> some View {
        VStack(alignment: .leading) {
            Button(action: toggle) {
                HStack(alignment: .center) {
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .frame(width: 10, height: 10, alignment: .center)
                        .foregroundColor(Color.gray)
                        .rotationEffect(Angle(degrees: isRotate ? 90 : 0))
                    
                    Text(key)
                    Spacer()
                }
            }

            if isOpen {
                Divider()
                valueView
            }
        }
    }
}
