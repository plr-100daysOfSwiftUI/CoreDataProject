//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Paul Richardson on 25.08.2020.
//  Copyright © 2020 Paul Richardson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@Environment(\.managedObjectContext) var moc
	@State private var lastNameFilter = "A"
	var sortDescriptors: [NSSortDescriptor] = [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)]
	
	var body: some View {
		VStack {
			
			FilteredList(sortDescriptors:sortDescriptors, format: .contains, filterKey: "firstName", filterValue: lastNameFilter) { (singer:Singer) in
				Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
			}
			
			Button("Add Examples") {
				let taylor = Singer(context: self.moc)
				taylor.firstName = "Taylor"
				taylor.lastName = "Swift"
				
				let ed = Singer(context: self.moc)
				ed.firstName = "Ed"
				ed.lastName = "Sheeran"
				
				let adele = Singer(context: self.moc)
				adele.firstName = "Adele"
				adele.lastName = "Adkins"
				
				try? self.moc.save()
			}
			.padding()
			
			Button("Show A") {
				self.lastNameFilter = "A"
			}
			.padding()
			
			Button("Show S") {
				self.lastNameFilter = "S"
			}
		.padding()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
