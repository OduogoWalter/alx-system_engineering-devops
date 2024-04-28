#!/usr/bin/python3
"""
1-top_ten: Prints the titles of the first 10 hot posts for a given subreddit
"""

import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 hot posts for a given subreddit

    Args:
        subreddit (str): The name of the subreddit

    Returns:
        None
    """
    # Set a custom User-Agent to avoid Too Many Requests error
    headers = {'User-Agent': 'MyBot/1.0'}

    # Reddit API endpoint for retrieving hot posts in a subreddit
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'

    # Send GET request to the API endpoint
    try:
        response = requests.get(url, headers=headers)

        # Check if the request was successful
        if response.status_code == 200:
            # Parse JSON response
            data = response.json()
            # Extract titles of the first 10 hot posts
            posts = data['data']['children'][:10]
            for post in posts:
                print(post['data']['title'])
        elif response.status_code == 404:
            # Subreddit not found, print None
            print("None")
        else:
            # Handle other error cases
            print(f"Error: {response.status_code}")
            print("None")
    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print("Error making request:", e)
        print("None")
