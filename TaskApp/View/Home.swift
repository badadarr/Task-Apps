//
//  Home.swift
//  TaskApp
//
//  Created by badar on 15/12/20.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    // Fetching Data...
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)],
                  animation: .spring()) var results : FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(results) { task in
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text(task.content ?? "")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(task.date ?? Date(), style: .date)
                                    .foregroundColor(Color.white)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
    
                            })
                            .foregroundColor(.black)
                            .frame(width: 250, height: 90)
                            .background(Color("Color"))
                            .cornerRadius(10)
                            
                            .contextMenu {
                                
                                Button(action: {homeData.EditItem(item: task)}, label: {
                                    Text("Edit")
                                })
                                
                                Button(action: {
                                    context.delete(task)
                                    try! context.save()
                                }, label: {
                                    Text("Delete")
                                })
                            }
                        }
                    }
                    .padding()
                })
            }
            
            // Add Button...
            
            Button(action: {homeData.isNewData.toggle()}, label: {
                
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        
                        AngularGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), center: .center)
                    )
                    .clipShape(Circle())
            })
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, content: {
            
            NewDataView(homeData: homeData)
        })
    }
}
