//
//  DetailsView.swift
//  BookWormPractice
//
//  Created by BigHand on 2021/01/26.
//

import SwiftUI
import CoreData

struct DetailsView: View {
    
    @Environment(\.managedObjectContext) private var viewContext: NSManagedObjectContext//CoreData
    
    @Environment(\.presentationMode) private var presentationMode
    
    let book: Book
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ZStack {
                    Image(book.genre ?? "Other")
                        .resizable()
                        .scaledToFill()
                    
                    let width: CGFloat = 100
                    let height: CGFloat = 50
                    Text(book.genre ?? "N/A")
                        .bold()
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: width, height: height)
                        .backgroundColor(Color.black)
                        .position(x: reader.size.width - width / 2,
                                  y: reader.size.height - height / 2)
                }
            }
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let viewContext = PersistentContr
    static var previews: some View {
        DetailsView()
    }
}
