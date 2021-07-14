//
//  MovieDetailView.swift
//  Moviez
//
//  Created by Jorge Giannotta on 13/07/21.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    
    let movie : Movie
    let viewModel : MovieViewModel
    let backgroundColor : Color
    
    init(movie: Movie, viewModel: MovieViewModel) {
        self.movie = movie
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: movie.category))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .center, spacing: 50, content: {
                
                Spacer()
                
                KFImage(URL(string: movie.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250, alignment: .center)
                    .padding(.horizontal,100)
                    .zIndex(1)
                
                VStack(alignment: .center, spacing: 50, content: {
                    
                    Text(movie.title.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .accentColor(Color.primary)
                    
                    Text(movie.category)
                        .font(.headline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .background(RoundedRectangle(cornerRadius: 20).fill(backgroundColor))
                        
                    
                    Text(movie.year)
                        .font(.headline)
                        .accentColor(Color.primary)
                        .padding([.leading,.trailing], 30)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    VideoView(videoID: movie.trailer)
                        .frame(height: 250, alignment: .center)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                })//: VStack
                .padding(.horizontal)
                .padding(.bottom, 0)
//                .background(
//                    Color.secondary
//                        .clipShape(CustomShape())
//                        .padding(.top, -105)
//                )
            })
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .all)
            .background(Color.secondary).ignoresSafeArea(.all, edges: [.top,.leading,.trailing])
            .padding(.horizontal,-5)
            
        })
        .ignoresSafeArea(.all, edges: .all)
        .background(Color.secondary).ignoresSafeArea(.all, edges: .all)
        
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
