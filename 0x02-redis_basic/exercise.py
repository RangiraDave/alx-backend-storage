#!/usr/bin/env python3

"""
Create a Cache class. In the __init__ method, store an instance of the Redis client as a private variable named _redis (using redis.Redis()) and flush the instance using flushdb.

Create a store method that takes a data argument and returns a string. The method should generate a random key (e.g. using uuid), store the input data in Redis using the random key and return the key.

Type-annotate store correctly. Remember that data can be a str, bytes, int or float.
"""

import functools
from functools import wraps
import redis
from typing import Union, Any, Callable
import uuid


def count_calls(method: Callable) -> Callable:
    """Decorator that increments the count of how many times a function is called."""
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper function that increments the count of how many times a function is called."""
        self._redis.incr(method.__qualname__)
        return method(self, *args, **kwargs)
    return wrapper

def call_history(method: Callable) -> Callable:
    """Decorator that stores the history of inputs and outputs for a particular function."""
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper function that stores the history of inputs and outputs for a particular function."""
        self._redis.rpush(method.__qualname__ + ":inputs", str(args))
        output = method(self, *args, **kwargs)
        self._redis.rpush(method.__qualname__ + ":outputs", str(output))
        return output
    return wrapper


def replay(method: Callable) -> None:
    """Display the history of inputs and outputs for a particular function."""
    method_name = method.__qualname__
    inputs = method_name + ":inputs"
    outputs = method_name + ":outputs"
    redis = method.__self__._redis
    count = redis.get(method_name)
    print(f"{method_name} was called {count.decode('utf-8')} times:")
    for input, output in zip(redis.lrange(inputs, 0, -1), redis.lrange(outputs, 0, -1)):
        print(f"{method_name}(*{input.decode('utf-8')}) -> {output.decode('utf-8')}")


class Cache:
    """Represents an object for storing data in Redis Data Storage."""
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Generates a random key and stores the input data in Redis using the random key."""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str) -> Union[str, bytes, int, float]:
        """Gets the data stored in Redis using the key."""
        return self._redis.get(key)

    def get_str(self, key: str) -> str:
        """Gets the string data stored in Redis using the key."""
        return self._redis.get(key).decode('utf-8')

    def get_int(self, key: str) -> int:
        """Gets the integer data stored in Redis using the key."""
        return int(self._redis.get(key))
