#!/usr/bin/python3
"""
0-subs: Retrieves the number of subscribers for a given subreddit
"""

import requests


def number_of_subscribers(subreddit):
    """
    Retrieves the number of subscribers for a given subreddit

    Args:
        subreddit (str): The name of the subreddit

    Returns:
        int: The number of subscribers for the subreddit,
        or 0 if the subreddit is invalid
    """
    # Set a custom User-Agent to avoid Too Many Requests error
    headers = {'User-Agent': 'MyBot/1.0'}

    # Reddit API endpoint for retrieving subreddit information
    url = f'https://www.reddit.com/r/{subreddit}/about.json'

    # Send GET request to the API endpoint
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)

        # Check if the request was successful
        if response.status_code == 200:
            # Parse JSON response
            data = response.json()
            # Extract and return the number of subscribers
            return data['data']['subscribers']
        elif response.status_code == 404:
            # Subreddit not found, return 0
            return 0
        else:
            # Handle other error cases
            print(f"Error: {response.status_code}")
            return 0
    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print("Error making request:", e)
        return 0
