class EnvConstants {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "https://api.themoviedb.org/3/");
  static const IMAGE_BASE_URL = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w185");
  static const API_KEY = String.fromEnvironment('API_KEY',
      defaultValue: "5a93c12dd088fc8373eae17bfadb958c");
}

// https://api.themoviedb.org/3/movie/popular?api_key=5a93c12dd088fc8373eae17bfadb958c
