import json
import urllib.request
from datetime import datetime
import boto3

def fetch_genres(api_key):
    """Fetch genre mappings from TMDb using urllib."""
    url = f'https://api.themoviedb.org/3/genre/movie/list?api_key={api_key}'
    with urllib.request.urlopen(url) as response:
        genres = json.loads(response.read().decode())
    return {genre['id']: genre['name'] for genre in genres.get('genres', [])}

def fetch_popular_movies(api_key, page=1):
    """Fetch a page of popular movies from TMDb using urllib."""
    url = f'https://api.themoviedb.org/3/movie/popular?api_key={api_key}&page={page}'
    with urllib.request.urlopen(url) as response:
        movies = json.loads(response.read().decode())
    return movies

def lambda_handler(event, context):
    api_key = 'fb180f5eb2c8dcad66220cd1e2ffb654'
    genre_map = fetch_genres(api_key)
    popular_movies = fetch_popular_movies(api_key)

    formatted_movies = []
    for movie in popular_movies.get('results', []):
        formatted_movie = {
            'title': movie.get('title'),
            'genres': [genre_map.get(genre_id, 'Unknown genre') for genre_id in movie.get('genre_ids', [])],
            'original_language': movie.get('original_language'),
            'popularity': movie.get('popularity'),
            'release_date': movie.get('release_date'),
            'vote_average': movie.get('vote_average'),
            'vote_count': movie.get('vote_count')
        }
        formatted_movies.append(formatted_movie)

    # Save to S3
    s3 = boto3.client('s3')
    bucket_name = 'moviesdb-raw'
    current_date = datetime.now().strftime("%Y-%m-%d")
    file_name = f"popular-movies-{current_date}.json"
    s3.put_object(Bucket=bucket_name, Key=file_name, Body=json.dumps(formatted_movies, indent=4))

    return {
        'statusCode': 200,
        'body': json.dumps(f'Successfully written popular movies data to {file_name}')
    }
