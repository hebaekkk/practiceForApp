//
//  ContentView.swift
//  BookWormPractice
//
//  Created by BigHand on 2021/01/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext: NSManagedObjectContext
    @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(key:  "dateFinished", ascending: true)])
    
    var books: FetchedResults<Book>
    
    @State var showAddBookView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.id) { book in
                    NavigationLink(
                        destination: Detail,
                        label: {
                            /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                        })
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
