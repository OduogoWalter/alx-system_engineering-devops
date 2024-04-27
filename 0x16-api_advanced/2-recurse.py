#!/usr/bin/python3
"""
2-recurse: Recursively retrieves the titles
of all hot articles for a given subreddit
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively retrieves the titles of all hot articles for a given subreddit

    Args:
        subreddit (str): The name of the subreddit
        hot_list (list): List to store the titles
        of hot articles (default is empty list)
        after (str): Identifier for the last post
        in the current page (default is None)

    Returns:
        list or None: List containing titles of hot articles,
        or None if subreddit is invalid
    """
    # Set a custom User-Agent to avoid Too Many Requests error
    headers = {'User-Agent': 'MyBot/1.0'}

    # Reddit API endpoint for retrieving hot posts in a subreddit
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'

    # Parameters for pagination
    params = {'after': after} if after else {}

    # Send GET request to the API endpoint
    try:
        response = requests.get(url, headers=headers, params=params)

        # Check if the request was successful
        if response.status_code == 200:
            # Parse JSON response
            data = response.json()
            # Extract titles of hot posts
            posts = data['data']['children']
            for post in posts:
                hot_list.append(post['data']['title'])
            # Check if there are more pages of hot posts
            after = data['data']['after']
            if after:
                return recurse(subreddit, hot_list=hot_list, after=after)
            else:
                return hot_list
        elif response.status_code == 404:
            # Subreddit not found, return None
            return None
        else:
            # Handle other error cases
            print(f"Error: {response.status_code}")
            return None
    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print("Error making request:", e)
        return None
