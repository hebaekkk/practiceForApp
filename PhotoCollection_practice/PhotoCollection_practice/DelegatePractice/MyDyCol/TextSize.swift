//
//  TextSize.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/25.
//

import UIKit

public struct TextSize {
    private struct CacheEntry: Hashable, Equatable {
        let text: String
        let font: UIFont
        let width: CGFloat
        let insets: UIEdgeInsets
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            hasher.combine(width)
            hasher.combine(insets.top)
            hasher.combine(insets.left)
            hasher.combine(insets.right)
            hasher.combine(insets.bottom)
        }
        
        static func ==(lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
            return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
        }
    }
    private static var cache: [CacheEntry: CGRect] = [:] {
        didSet{
            assert(Thread.isMainThread)
        }
    }
    
    public static func size(_ text: String, font: UIFont, width: CGFloat, insets: UIEdgeInsets = .zero) -> CGRect {
        let key = CacheEntry(text: text, font: font, width: width, insets: insets)
        if let hit = cache[key] {
            return hit
        }
        
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: .greatestFiniteMagnitude)
        let attrbutes = [NSAttributedString.Key.font: font]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        var bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attrbutes, context: nil)
        bounds.size.width = width
        bounds.size.height = ceil(bounds.height + insets.top + insets.bottom)
        cache[key] = bounds
        return bounds
    }
}
