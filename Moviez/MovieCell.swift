//
//  MovieCell.swift
//  Moviez
//
//  Created by Jorge Giannotta on 13/07/21.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    
    let movie : Movie
    let viewModel : MovieViewModel
    let backgroundColor : Color
    
    init(movie: Movie, viewModel: MovieViewModel) {
        self.movie = movie
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: movie.category))
        
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                
                Text(movie.title.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    
                    Text(movie.category)
                        .font(.headline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24, alignment: .center)
                    
                    KFImage(URL(string: movie.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68, alignment: .center)
                        .padding([.bottom, .trailing], 4)
                    
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: 0, y: 0)
    }
}
