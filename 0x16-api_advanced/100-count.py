#!/usr/bin/python3
"""
100-count: Recursively retrieves the titles of all hot articles for a given
subreddit and counts occurrences of given keywords
"""

import requests

def count_words(subreddit, word_list, after=None, count_dict={}):
    """
    Recursively retrieves the titles of all hot articles for a given subreddit
    and counts occurrences of given keywords

    Args:
        subreddit (str): The name of the subreddit
        word_list (list): List of keywords to count occurrences of
        after (str): Identifier for the last post in the current page (default
                     is None)
        count_dict (dict): Dictionary to store counts of keywords (default is
                           empty)

    Returns:
        None
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
                title = post['data']['title']
                # Split title into words and count occurrences of keywords
                for word in title.split():
                    word_lower = word.lower().rstrip('.,!?')
                    if word_lower in word_list:
                        count_dict[word_lower] = count_dict.get(word_lower, 0) + 1
            # Check if there are more pages of hot posts
            after = data['data']['after']
            if after:
                return count_words(subreddit, word_list, after=after,
                                   count_dict=count_dict)
            else:
                # Print sorted count of keywords
                sorted_counts = sorted(count_dict.items(),
                                       key=lambda x: (-x[1], x[0]))
                for word, count in sorted_counts:
                    print(f"{word}: {count}")
        elif response.status_code == 404:
            # Subreddit not found, print nothing
            return
        else:
            # Handle other error cases
            print(f"Error: {response.status_code}")
            return
    except requests.exceptions.RequestException as e:
        # Handle request exceptions
        print("Error making request:", e)
        return
