//
//  APICaller.swift
//  MyMovies
//
//  Created by Богдан Бакун on 14.06.2023.
//

import Foundation

struct Constants {
    static let APIKey = "7d9f80c1744d42f64f0d34ce9fa1deb0"
    static let baseURL = "https://api.themoviedb.org/"
    static let youtubeAPIKey = "AIzaSyA7aweT3vP91WYLj59jjsi8Pv7CI1wHws8"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    private let session = URLSession.shared
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.APIKey)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> ()) {
        guard
            let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.APIKey)&query=\(query)")
        else { return }
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> ()) {
        
        guard
            let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL(string: "\(Constants.youtubeBaseURL)q=\(query)&key=\(Constants.youtubeAPIKey)")
        else { return }
        
        let task = session.dataTask(with: url) { data, _, error in
            guard
                let data, error == nil
            else { return }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
