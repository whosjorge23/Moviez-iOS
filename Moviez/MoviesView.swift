//
//  MoviesView.swift
//  Moviez
//
//  Created by Jorge Giannotta on 13/07/21.
//

import SwiftUI

struct MoviesView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = MovieViewModel()
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                TextField("Search a term here", text: $searchText)
                    .padding(.leading,24)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .padding(.vertical,5)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            if isSearching {
                                Button(action: {
                                    searchText = ""
                                    //Dismiss Keyboard
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .padding(.vertical)
                                })
                                
                            }
                        }.padding(.horizontal,32).foregroundColor(.gray)
                    )
                LazyVGrid(columns: gridItems, spacing: 16, content: {
                    ForEach((viewModel.movie).filter({"\($0.title.capitalized)".contains(searchText.capitalized) || "\($0.category.capitalized)".contains(searchText.capitalized) || searchText.isEmpty})) { movie in
                        NavigationLink(
                            destination:MovieDetailView(movie: movie, viewModel: viewModel),
                            label: {
                                MovieCell(movie: movie, viewModel: viewModel)
                            })
                        
                    }
                })
            })
            .navigationTitle("Movies")
            
        }
        .accentColor(.white)
        
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .preferredColorScheme(.dark)
    }
}
