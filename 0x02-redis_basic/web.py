#!/usr/bin/env python3
"""
Script to create a module with tools for caching and tracking function calls.
"""

import redis
import requests
from typing import Callable
from functools import wraps


store = redis.Redis()


def data_cache(method: Callable) -> Callable:
    """
    Decorator that caches the return value of a function using Redis.
    """
    @wraps(method)
    def wrapper(*args, **kwargs):
        """
        Wrapper function that caches the return value of a function using Redis.
        """
        key = str(args) + str(kwargs)
        if store.exists(key):
            return store.get(key)
        value = method(*args, **kwargs)
        store.set(key, value)
        return value
    return wrapper


@data_cache
def get_page(url: str) -> str:
    """
    Function that returns the content of a web page.
    """
    return requests.get(url).text
